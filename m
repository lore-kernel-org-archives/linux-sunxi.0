Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA91101E3
	for <linux-sunxi@lists.linux.dev>; Thu, 28 Dec 2023 19:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="YU5K7KC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1703792376; x=1704397176; i=wahrenst@gmx.net;
	bh=b0edislHopr8EPtQ1enGkNrsXXNvjXTznHe/lchgmc4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=YU5K7KC9H4sIXdlU0G4CpXOyiPS8GzyjLpsyfO73x8/Y6ko2MAyIS2Q5t6sImetj
	 F6HtzPrGFpKd3zZ9CMaEspdHEbWWV89if6iwEXDVr/daNIENZzfRiqt7lvxOSRCT5
	 M/EGmaYfO28KNr6qxylFFuS2E9JS2xUVv/jIzQOcAz2yKKpS7f9eAHwHDCTbNhXVa
	 pmZdEDjb14Bh6za5dUegqBrTSjVQ7PkNkfHMv2Y3D5VFri4g3AqVekFQrflHummzH
	 325CDW5QoOJVNvX0xpdcHnKocAyRyUNdJf+XXx1bgvVaMppb2AVnu19YrJOqBryAA
	 XRMURhUfJEsDn3V/1w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9X9-1rRUvx1okz-009BbN; Thu, 28
 Dec 2023 20:39:36 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>,
	linux-sunxi@lists.linux.dev,
	soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH V2 2/2] ARM: sun9i: smp: fix return code check of of_property_match_string
Date: Thu, 28 Dec 2023 20:39:03 +0100
Message-Id: <20231228193903.9078-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231228193903.9078-1-wahrenst@gmx.net>
References: <20231228193903.9078-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZkFHk/GUAFOj07mCKAFPN53ViYLKkHX2XMWirbFXT9iQfryqjfL
 xl73iQC00/oPWxShovRgVxTMrp6/uvMWaWRwwIRI09tmlSSTDrYrRN/sqP7J79olzMqS93O
 7hX92IA2L52CefjNho2LxNZ33+/0DiTMYrcFnDqMSUbhLoy0zy1fbd6a2V6nnYU1uZN4CkB
 gXacDgawQLX0u8f8XAkCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mYahOp04Ofk=;SLmGj1svWcfzqHdMPlyxU1A+3FI
 dR/KpOtTiegOsXoIGmOmlmuZUeGH8yJCN015v9FKW4arSfrw5dJXrGI+tv762zsHAG17c1sVp
 E577DKQjSuf0GcFn+hV/kR67wpPU3HD29u/MZex+QGSKccVP1rJqhMrFV5vE68AnkevDVoBwi
 0fcOh7xj1ENxJeQ+AX62h9oebphIgqVvR49BL3kVZA0nFsPvew6F2TNU2M+9jFbcZA98YtBJo
 1KXH7fCCrziFqrAKG/OKbszgeTT5+Q6TfvnKv4pAmqYjGVdI11/03nHmEmOMX+Qv8VIClkROD
 eDrLJv9sit1DfxIFz07DX5m5nUo1rdpzBGrgDF/RJHBsqT1XmPb8HVVFr49ymeY0oextr/Pfr
 f2YaZR2IFTiFAv3Sdks2hwelnTKMcWnWWmRJc96Rq+wlSV0ZsvgcAU20nhDv9Rkzglj987NP5
 8u6ZuGm/TeZRHzmcKJNMb8f88Z7q1JKRB9vOx8Pw5i3KB69jBgYc12QJfSlXt7kiJxsrw9gTE
 RuMnLr3HW7wXeuDnsZIuUjkia9NhhXnln7l1mjofz4X/n1Zx0rqfedc7nCGuxkANZIVKvzAKG
 TVu7UzvMeAgre2uK8FF0RIzaKLwjFwb9Gstx9Ef0ZuZdoGUOY9lvUtfqOQ+o9P21IMxcvlYSL
 cHfx0N7ScWrxJC9R+I9trLvvCppNTvuH0TU+DpysWSOIX9Q+g2bIvJ//4v4RWqb2/Lb0Kw6zn
 ducg8x+zUq61hONnrjemQQH/UBqGM8xE1Qc0H7b/1URh5/9EYCrpArzONhe7LwoUXHc5nay0Z
 HGejECeO7ZG0kkw+Un9s8W5sA6MgnGy4rfS4ZwZKGN1+4bZGRn5C5ur9zxt+Kv9O+TmEn3S5G
 hOp6jEAVhjXLVxdq5tN8BMUVM4+2qvCWXigNa3FKSbwhACG3bqQG0Yaq3EcEyZAHnGU8fiBSq
 aJX1JqC37XnZyFJbG3pWotCq7ryFEZ5x35VFBvKjEEyC1GBM

of_property_match_string returns an int; either an index from 0 or
greater if successful or negative on failure. Even it's very
unlikely that the DT CPU node contains multiple enable-methods
these checks should be fixed.

This patch was inspired by the work of Nick Desaulniers.

Link: https://lore.kernel.org/lkml/20230516-sunxi-v1-1-ac4b9651a8c1@google=
.com/T/
Cc: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/mach-sunxi/mc_smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-sunxi/mc_smp.c b/arch/arm/mach-sunxi/mc_smp.c
index 6ec3445f3c72..277f6aa8e6c2 100644
=2D-- a/arch/arm/mach-sunxi/mc_smp.c
+++ b/arch/arm/mach-sunxi/mc_smp.c
@@ -803,12 +803,12 @@ static int __init sunxi_mc_smp_init(void)
 	for (i =3D 0; i < ARRAY_SIZE(sunxi_mc_smp_data); i++) {
 		ret =3D of_property_match_string(node, "enable-method",
 					       sunxi_mc_smp_data[i].enable_method);
-		if (!ret)
+		if (ret >=3D 0)
 			break;
 	}

 	of_node_put(node);
-	if (ret)
+	if (ret < 0)
 		return -ENODEV;

 	is_a83t =3D sunxi_mc_smp_data[i].is_a83t;
=2D-
2.34.1

