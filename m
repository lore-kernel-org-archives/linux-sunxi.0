Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929177;
	b=3lNbv3Q7taU+J1W1Wuf/1xtCPpHIVWg9Enn8QYmsPaaVbGeRLETp7vXPC4nHAnFvS6po
	 U8jpSr20luolNtJF+PC6iFTHQkxOGn1RJsZIBzHuqcVuFcToDMCmC2BNZsC1dBpY8xwtC
	 VNnkrsHFleAdqMnfxHU+5CYhR06KrDJ/uv9XDTObUQd1/crxd5vXuzMXPtTPVNYbCFDyz
	 3r89Q9KoTxZT0duRb7o+VInACy45UkekxTNIZ4eczWwy76oGeCkm+rg6oXU0j+jkbVkZQ
	 13QI/xu2qlGLn70HSo0GJhSjO6K6/1fmBmcz/VPJV2RkDNTNBYiP5TPmZSrwaXCqLgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vBPOLGbjQHm2dEs2LFQcVrcZ3yp94sR2RDaK/4V+R0U=;
	b=DUOrnAPS2yUd/BiFxrLsTx3aLeSYr9TpmVrlh1Qzy4k0HlyHvDCfzSTBJQtkuOqTNIDt
	 vhQ1nTJwyC7DernRj/2pLKI5ETrOKf77T/vlznbP2/zNojbBkgZzoX12sD/s86v55SovH
	 ozkzj5b0QBoru6ehVOQVKGs08C6M7P8ol4JgSlZLgExeR8oHpHpgxBMIWRUJ1L41xl1if
	 ybGvpnRXpl/N/ociRCtgQm1GUEbCJBTdP5u2Jvnqox8MeGLGx6kOqRF9oaR7A0mdMrLgZ
	 5lBqeGS6kSeDYVWUL/hwfN21InuajOFPsJbkN4L161/Uc93BCsRfPFxmfdsUojYPivw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WOK5naCi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c4Dp8XXt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5322606A32F
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 15:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5322606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WOK5naCi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c4Dp8XXt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0qZ63047897
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 15:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vBPOLGbjQHm2dEs2LFQcVrcZ
	3yp94sR2RDaK/4V+R0U=; b=WOK5naCiqB7oN+BcYiBV1TTMRGwYxJjX6kguGQBp
	UVLtobmT0q49Xys5cMtJvKuWcFwTI2zEOw5DLGgBkJNN7ot4WJDTh7V2Ce5qlKSe
	sFI5cBonrDt0QwwMZnAd+tsTvElLZ6+iJYVNN8liQ+Q+04r+Z9jj2HOv9WFunqYr
	pPqKoNUhb8A69wNsj64wfP7G3UKgT87rr+dxzG8gs5XlG/P9+M5EWJli1b6q2bX8
	9D1L+56I4dkkMX8kTXP6WDAi6D8YIbl+t++WOgdHLzARJwMsnxxW4iQ/BvvzjiI8
	L9dEmvGaukugxvux0TfPw4SOgRv1AGtruP/PYzwHo6ffoQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv119yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 15:26:15 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99e0e6de971so417100241.3
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 07:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794929174; x=1795533974; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vBPOLGbjQHm2dEs2LFQcVrcZ3yp94sR2RDaK/4V+R0U=;
        b=c4Dp8XXt35VO9iS2LzXVTwqHUz/tpApAjhm+wIQ4gM7co/AcFcgYz69jt+zfiMdi35
         pMuCdy+tJ3RZVvKTzR3i8UpXta+tLVFjwHiDlXDmrAdQefHITgBOHgQiOn2BP1yC4rug
         5YFH47Zl9Q4p0cIls8sH1dhKZvAe0vL0HxA95ydFR6vGj6E8tzQ1BAdirmKVDWw2stBp
         ozCJatl0eZo3gt+LBzw1zL/VtagS4MxgtkxgCyUMmN9flhXpM5PrtVq/tfBhyPZW/tsp
         ps5FLg92tZ/eT0njPkKtNskY0Z8RQcwubRz3+wU0zC9gwff60anMsOZKYim7C2y2/Xx9
         NdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929174; x=1795533974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBPOLGbjQHm2dEs2LFQcVrcZ3yp94sR2RDaK/4V+R0U=;
        b=MlOExX7/AB7IUEldlRbZ51CdglUNYr1nidGZDUWVLFRub99MuAV2oEBCSvCO03ycHL
         h/DH4YzbVX8ApdEqmkhr/7SzJfySSVt3uRJihsUrzfAwQy4/EReyEEVi1jeQ4G33qSG7
         gjNlybYwC3NCdJB2KkSjRFHokH2k+ZwOsR1eHcLEIIqszv+h0PGwWmIr3zfPa5abtbDr
         h/8LVDsDl4MFCiwKF5NO67z7Wp3ijtkPDdfUFlcwjnwOMbWCHOmZ3rZZ+qGMB0m6Nlsx
         1gpqRaap5T726IXMdNOGPvDRS43XQJUVYvMtDY4jsZUd5Nban1cyi/EN8c5UKTdJKQyu
         L+rw==
X-Forwarded-Encrypted: i=1; AL+hErGl4KM4CwtQ/VFfmpCg4FGXxEXNrL9xOwW3Z0FBOHa4uC40hgNNKrLq2G0+ncJuyDXHxHfk/QPBDFXk9Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8VmidrYodwjoE8vzTOpWXUUJsC9dlPfICSULRKbK9KKTJEbAlA
	2cduZnO+AfJe1KdfqO3K+Sl7tTi3ZUys5d3fIe2mPzxO35aohhdsiaXsOL7waKtrya7CM76g8hz
	HXEdjMsdf3D9mQuTq+JDJtc80VNl13zJLfsjFzmb3OBtp1IEkjELbf58EHoqYRGdl0A==
X-Gm-Gg: AYBFou3RAHyxhpSDyhb50gR92BHmuiKeQ0dPue8kYHG1YSwhO95OFYMQAdTH19h1cpK
	ULBCOZqcW8W18NPLFThoDPMu1ZMUrGinFLcIzbWKEOBvFXrdjkKhfc3olond4RWognO8c1ymMW4
	4mgENj/Xk5/+AO05bRdlAdzRdFueFfgmD+Hd1gP4sWituFKhjpLZoK44u61gIkuHgzYCNUbTL/A
	RCusWyoVMgDWNljiu+Bwh6i/Nhr7dYCUPDmYw12hHv+WLpdBzB4YOZNq+bLW4Ypuwt9ynDLWHOD
	8HE6L9c6NhCPPDbk7cxi3GqOwnzLrqcgNaKb55EyQj4Lrgu6ow7HrdVXUhFA9BRqRJH5NVDzep4
	zn3D+DtmN/sJpSj49tWH/ZF//j/3+8VCJWfFO+W/yhk6fhM6ugJm45SNY8a4NupQ=
X-Received: by 2002:a05:6102:a4b:b0:7cc:1192:563c with SMTP id ada2fe7eead31-7d64d770298mr3870759137.25.1794929174101;
        Tue, 17 Nov 2026 07:26:14 -0800 (PST)
X-Received: by 2002:a05:6102:a4b:b0:7cc:1192:563c with SMTP id ada2fe7eead31-7d64d770298mr3870721137.25.1794929173461;
        Tue, 17 Nov 2026 07:26:13 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm82176765e9.1.2026.11.17.07.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:26:11 -0800 (PST)
Date: Tue, 17 Nov 2026 16:26:11 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        LABBE Corentin <clabbe.montjoie@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
Message-ID: <avxyE59XdBkdK0Jc@lore-qca>
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <a1efeff8-2963-4859-bacb-55fdc1f5370c@bootlin.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4RtWT8mPemudz8XJ"
Content-Disposition: inline
In-Reply-To: <a1efeff8-2963-4859-bacb-55fdc1f5370c@bootlin.com>
X-Proofpoint-GUID: ouLaineeNgd1ntRw8o-AArj991YHMOzy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfXzn6QgWU/eX2Z
 hUw8krqnTySiUZlf8J63/pifH7W3mstKoGuBZzof1ENmoM75Duf+0AQ5NY/NIwxVt1jcSffeR7J
 o8GqF4fsHLwSwx+bY1iJx1ljFlLP3jI=
X-Proofpoint-ORIG-GUID: ouLaineeNgd1ntRw8o-AArj991YHMOzy
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc7217 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=fy4Z4mAkg3wtpZJeIqMA:9 a=CjuIK1q_8ugA:10
 a=AU2tUvvXhtKScF8-c3EA:9 a=TD8TdBvy0hsOASGTdmB-:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfXxo9LHjky+h7h
 +ggzzNDaJtR4lVd2fiqCSZFZL6F0OfG5k0ZpvFdlw2fTyl2H+iSPpVXLrhXB5oEUoTZFN4qWFQC
 6wD56YPFGAGwbYB9SaaTl7PD8IuthcINCYmWdjqG+0ZqrebYoEj/j2Dyp+4itpdzkKQxgzjM+IH
 fnXZlmWIEE7oC5uZ7G+XRnpXlLyoDyZZUrGSUJ3EGZ1KVjuAurrq/fosRwSG7+v/8h3bUL8InzJ
 dHgow3f6CKwKUk9URjCkZOcHiKxSOdwcx9H27cuzDCKVI0CBDDeIdw5E+R3XoswkqD+MQOdGfyV
 auf3ooD38gVMXCALrRTIwLBewQHpxQppfsy3BS6A5ruiVat+TK0a9+7ux3PdYzB8FcJpRM0I0p2
 6tkuEwIbdhemqGO6rN22+pI0j0+h9VdHvLM6w9rXwbHKWApe8D4w3YaWN0jpd5Mr7Q6cRTNkIEq
 aMa2azSLslOZpHOWWeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170061

--4RtWT8mPemudz8XJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi,
>=20
> On 11/16/26 01:58, James Hilliard wrote:
> > stmmac_set_features() clears hw->rx_csum when RX checksum offload is
> > disabled, but sun8i_dwmac_rx_ipc_enable() unconditionally enables the
> > hardware checksum engine. The MAC therefore keeps dropping packets with
> > invalid IP or transport checksums before they reach the host, even after
> > ethtool reports RX checksumming as disabled.
> >=20
> > Set or clear EMAC_RX_DO_CRC according to hw->rx_csum so that disabling
> > offload leaves checksum validation to the network stack. Preserve the
> > callback's existing success return value.
> >=20
> > Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>=20
> Nice and simple, I tested that on an orangepi zero, with an allwinner
> H2+, and I can indeed see the difference as bad chksum packets are
> dropped on that core.
>=20
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

>=20
> Maxime
>=20
>=20

--4RtWT8mPemudz8XJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavxyEwAKCRA6cBh0uS2t
rCitAQCwtjLO8o2NUJzAsuBjPyc3kLWkrELN5vyl2FxMXkSmiwD+NtH/Z63B68b9
5KXnXA59zeSZCmCwsKk9CxtQXtPZ5QY=
=oVi3
-----END PGP SIGNATURE-----

--4RtWT8mPemudz8XJ--
