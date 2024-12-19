import unittest
from flinkjob import *
class TestFlinkController(unittest.TestCase):

    #verifica l'efettiva capacita di connettersi a db ed effettuare query
    #+ coretta struttura del output
    def test_db_query(self):
        self.assertEqual(True, False)#TODO Implementazione test

    #verifica l'efettiva capacita di generare una richiesta ben formata al servizio llm
    def test_llm_request_creation(self):
        self.assertEqual(True, False)#TODO Implementazione test

    #verifica il parsing di una risposta ben formata
    def test_llm_valid_reply(self):
        self.assertEqual(True, False)#TODO Implementazione test

    #verifica la gestione di risposte dalla lunghezza eccessiva    
    def test_llm_invalid_reply_lenght(self):
        reply ="A"*400
        coordinates =[]
        mock_db=MockDB()
        errors_logger=MockErrorLogger()
        mock_llm=MockConnection(False,reply)
        mapper=MapDataToMessages(mock_llm,mock_db,errors_logger)
        mapper.open("")#andrebbe passata la runtime ma la funzion non ne fa alcun uso in ogni caso
        mapper.map(coordinates)
        self.assertEqual(errors_logger.read_errors(), ["llm reply over 400 charachters"])
        #errors_logger.clear_errors()

    #verifica la gestione di risposte che non rispettano pienamente il formato ma facilmemte recuperabili
    def test_llm_partially_invalid_reply_formatting(self):
        cases =[[" - No match ",["llm reported no match"]],[" No match -",["llm reported no match"]],[" - No match - Matched.....",["llm repoted no match but still geneated text"]]]
        mock_db=MockDB()
        coordinates =[]
        for case in cases:
            errors_logger=MockErrorLogger()
            mock_llm=MockConnection(False,cases[0])
            mapper=MapDataToMessages(mock_llm,mock_db,errors_logger)
            mapper.open("")#andrebbe passata la runtime ma la funzion non ne fa alcun uso in ogni caso
            mapper.map(coordinates)
            self.assertEqual(errors_logger.read_errors(), cases[1]) 
            errors_logger.clear_errors()

    #verifica la gestione di risposte completamente irrecuperabili/ contenenti artefatti/espongono info sensibili
    def test_llm_completely_invalid_reply_formatting(self):
        #TODO definire return per errori
        cases =[["Utente: ",["llm reply contains forbiddent elements"]],[" Punti di interesse:",["llm reply contains forbiddent elements"]],["<script>...",["llm reply contains forbiddent elements"]],["<image onfail='...'>",["llm reply contains forbiddent elements"]],["<a href='...' >",["llm reply contains forbiddent elements"]]]        
        errors_logger=MockErrorLogger()
        mock_db=MockDB()
        coordinates =[]
        for case in cases:
            mock_llm=MockConnection(False,case[0])
            mapper=MapDataToMessages(mock_llm,mock_db,errors_logger)
            mapper.open("")#andrebbe passata la runtime ma la funzion non ne fa alcun uso in ogni caso
            mapper.map(coordinates)
            self.assertEqual(errors_logger.read_errors(), case[1]) 
            errors_logger.clear_errors()


    #def test_llm_invalid_reply_language(self):
        #self.assertEqual(True, False)#TODO Implementazione test

        
if __name__ == '__main__':
    unittest.main()