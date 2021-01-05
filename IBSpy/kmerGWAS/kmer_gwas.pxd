cdef extern from "stdint.h":
	ctypedef unsigned long long uint64_t
	ctypedef unsigned short uint8_t

cdef extern from "kmer_general.h":
	ctypedef uint64_t kmerGWAS_kmer

	kmerGWAS_kmer kmer2bits(char * k, uint8_t kmer_size)
	char * kmer_string_alloc(const uint8_t kmer_size)
	void kmer_string_free(char * res)
	void bits2kmer31(kmerGWAS_kmer kmer, uint8_t kmer_size, char * res)
	int kmer_compare (kmerGWAS_kmer a, kmerGWAS_kmer b)

cdef extern from "kmer_db.h":
	ctypedef struct KmerGwasTable:
		uint64_t number_of_kmers
		uint64_t capacity
		kmerGWAS_kmer * kmer
		uint8_t kmer_size
		uint8_t readonly

	KmerGwasTable * kmer_gwas_table_new(uint8_t kmer_size)
	void kmer_gwas_table_free(KmerGwasTable * * kgt)
	void kmer_gwas_table_add_kmers_from_string(char * sequence, KmerGwasTable * kgt)
	kmerGWAS_kmer kmer_gwas_table_get(uint64_t index, KmerGwasTable * kgt)

