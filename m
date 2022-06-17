Received: from sonic314-20.consmr.mail.ne1.yahoo.com (sonic314-20.consmr.mail.ne1.yahoo.com [66.163.189.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA2C2F25
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jun 2022 11:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1655466153; bh=5CPPxvhC6T96mWEH/gXJH34ww9z1KFmPZ7t1JL/4bzI=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=PjRCKCKulkBOI9JVw2aFASxBQ3OKWXF6ck4m1HYofR3B4JoZX4aGH7Auezn8d7H1cxe/tiQ/T2AqQMb28SyXiCqmOAk/Zt8sf90Y8+p7XTB07dwctXsC/h9U3czLv557VgzBSdB2ZiSq4hb3quxK3ulJJYIVDxg+X3zjTJzT2kVxr+FasICxjkMTiAWuIc+it8S74FcG7FdQ+IPMtkFlbInT26ICthTjTk1VJ40QSMqBgyyPU+OWmn/6AtFG6EkPtb6aF47xUzHTY8bjhZ+TXxNSSBCk+4X5NByIfQ960bMwvrGj0JTlAnioQVc45DSN+UUIZ/k78bQreNvAuQubLQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1655466153; bh=Lt53LyxdDrt3vWzI7ba81lPa9lVPR5A5+yPFxR1oKyo=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=e0oBKARd45G7FuPJaP+MAXGTdMlgIEX1zyVXn6HbVyBfXM5r3gEo7aGWohIF95y6WovyjtSjGua+ZCBbjJoRvHCvF8cR0XzWxAssEwSYGZhdTxxBwZJHaOZRW6z7O/BM1lJLeSffLJlhykI807wBU5o+Op0aHz/zt8nTNNLA3FYcZkMR61Hzy29zh6cwffzq3f/mLuhWbTm17jloKAvsWL9TWxlpo1ph8gdFLdyBqKkxSEQN0Wb30NDIIgT+FdeTp/TK8EKEEGqQD0hquR1bKpQKBO9xuETS7+I4vmG4mynLeupv8yjY941u18Q422sm6/MMxR7guNru2h+uRP32NA==
X-YMail-OSG: hL131qwVM1nA_UdxEKt5pTYGlHFAdZohdjpzd0OWEsUD2dl4eEvsamyzY.k9588
 Ce3z1IXycFsi.JfbhEt0ccs8CQcaIC_0EzCHi9JjMoeWiaPtojwU.LX3P1ykSolhRmPatSdaRams
 1WdY1.YuGIPMKu3h8m0C9mz7_plV6y.F.K0zOvcnx84dHPBUafG5.HJj_2zGtU7TZeGr6TbbIwvs
 tu_pUKq4ERDFl5MloXTdTQ1Cb6pLwp2bvflOeiLjsL2XtN5O.L0REW5.x8fACIfV9GU58QjNsoIL
 hdmrTxH4iyFAvI7Lh_q1PONaObAPPl71QQeEMdA7Pd3TMOrmAtCUnO7cRkuXdhdcZoBWkUkWewlv
 22OFVRjXhRbXBrUA3ocsuB_XXu0S1hebKDTB8qJlhRcJDjbxWi3kJLbGnXdGNquK.o9VPrMgei9_
 HnAPw1k9.XmmIxmmKDXEWR96kNUO_XECpQc2NFa6ouOCPrRf0rb2q.rCY.PtcNBQzYRYPI8rsPv2
 MTZwDGC3d6S7M5tjS57lFaDcCddwPwS6B8S2XWGBMcmD.43lcf3K794_OmRrNgOqxl00G4li0rDj
 8TLt2BGOiEwUtTu7dhfH_6.zILU_mO5CK5.EgIA9Kf0zdaxcOXzHqrC.vWgBosrlk3LVK4tprZlx
 rVP.BIcybWHn1reLrJm2NmNMGOKu3Dk_3KKiuIQqyoyEvfnwsMFRyLE30kx7iCGMfoF79WKw5TqI
 q0CH_u6_C87dt3fBKQymGO6wWIFDAnWI2sys650HdWDUXRfyx8OltrTp13HuntWM3cIgp4187hag
 JNRpilmwl5JkagqiPSr_j21YBgJpcTc2gTSx9ShlZaUOk6vPd7rlX7R0.r5WSUhqGv3.ycxV4VT6
 L.mQBwrYYP9QHqbPhNUC8F8XmtmJ.w5TbxsBcyMFVK6lCyB6eCcetMkHgJrWfb5kvPJHY90tQORf
 TV9SJ8SWo4b5skQ.hzZt5ThvuYZ_blXdjJwvHkJynKo2hGz_t79rFV2cy_k_BJwszipZgwTyMQ.r
 UoanhAMwiq9W3H9C5bLNdR736pe2WlsmgrhIRMdtU._41jKmx.QXPaYQ585p27iMhdFEnsDvH4Nj
 41a.B1hydXRnkKrq1QE5apCjMZVh1_xKxTpf7rWE9VWNKKS.4M3WIVUTuR0cUOvOMpacmpsnc5aG
 F5eSmvbGmd_6aU3EhIomM1nIsjsSpXXfts.x9jMrzRtKkZ8b8aK.O_ViUIY899QAWoyHH52q66EO
 PoGx5bj6OFulQj7W1QmBAO5Fu9.JQZIS_S20JqVMM3FJN3w03jNHF3RvQ.APybEQDRvUpnBw8Dl.
 ktPGboo8IjyNtbj7uZfzCHGU5dIaWbCrkpXmbR4DgrdyVD8zTPjLD6PljGkn4U4N2lSy.NeBk2E9
 enkV2XU630H.uIDgpHrX0AVFu1QVhcS.WNNc9qpGAUjDRIbAj2V._kELubCbyrYFXtjeDA.eKmR4
 jJB908ljQTPCg3w0qUzqIVgetRZkw_3YTPUWjoR4O5.8ZlnxnbckQdPyrwrMwt1hMH96qyoaA5in
 UPiZpNCwocdb4_AdjncbXzL_GAGr3anE670h7IXRnYQVDnwhJSrsiV3YAB3fQSsHzscqDVA9zFvK
 c_7nK3jb1rQLIpzXbCTr_NQ1ofHQNd.ub4jNosjF9WUyyNxEiuB6uCoIAxZEGZbyDdVQC4h5pn_t
 cA0iH7J_MjGOkmqpSmK47sg.N5DCLr7QOkkHf7_brm.XXZcEb_MhmiSbB.fbAfxZXhax6zEN_Fl4
 oUGsZkj4AXmZg94GuW5AE8qJ5lStHRxmKQh7q5YQr6OOFSklg62IqBJf8gMjp6jZDezmhWpAAbwW
 RxFmD3LZWpHn3y4tezZ6yzi7YyvX5ElFjk2X83ec.wXHFZKcVEPGtr2296iWyH1vbw6gulfS4QfY
 K7_N.mZSpaR5UITn_ikL2FYFNVY2SELUKPlm1hNJM2QQIEDjK.iSqOaDfPv86OtBcEWfOimgqClG
 13.ns4k_WeTkttB1CGDKsRhWQFnY3Cdgkgk5sxBP1S.NM93haBfBPoHST2d0s8q3S0l_1wFrhvct
 v8yMgtqlnrYuKxbSmOn45yuRmDFAFqg1SW3_dewX5EiDqC8FHzI.O1TMY1ZPx9Thwhf1RMdlBMgN
 rWAEkljy04cWCmX6CYyiVenf9f7D9qYTNNd8SSfRcew--
X-Sonic-MF: <tjosko@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Fri, 17 Jun 2022 11:42:33 +0000
Date: Fri, 17 Jun 2022 11:42:32 +0000 (UTC)
From: tjosko@yahoo.com
To: linux-sunxi@lists.linux.dev
Message-ID: <1421960305.5077928.1655466152034@mail.yahoo.com>
Subject: sun8i_codec_analog requires sun4i_codec to work but doesnt depend
 on it
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1421960305.5077928.1655466152034.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.20280 YMailNodin

kernel: 5.18.5, board: Libre Computer Board ALL-H3-CC H5

unless there is some bug in initialization, modprobe'ing sun8i_codec_analog doesnt enable audio on H5. doing modprobe sun4i_codec results in working audio and sun4i_codec having 'uses' increased in lsmod indicating it's required
