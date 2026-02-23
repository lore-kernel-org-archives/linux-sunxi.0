Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613E334EF08
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837218; cv=none; b=JT6RP1vT88Ry6LubGF4D5Ru57L3j/EmG39F8yAjW3Z0lcpx8yE8YhZY4n5JWOHeMH4z/6UXJVMfo89omEkrM605Kr7ih70nwrSs5UMwNXdpzi1t4or+TTmsfC48zA2gDOgOIQlf0kvre1+xiNjGfJ+Qi5IRHKqxteYchanq1M68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837218; c=relaxed/simple;
	bh=Z5y+uDYDLt8QrBK74QcxPQFJYMWolbieGXxGJWOf/Z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HN1sI3PIRoSN/URLlWNey4Rhbxu90IL1ZiXbIOjRDa3+R50X+KDcO1WYQ9QIgGsN1GECEAuTl7KD0qUyJWGNokh8VexvM0lq11Hev3xth77wm7R/cq/Vqjm8MHzMYTRw8hEvuqD3qss3SWyb4wgOs+KX+pk3TmfCwWm4JA1KHaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z31W/9nu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TZTRsttm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z31W/9nu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TZTRsttm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MKllql1754162
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=; b=Z31W/9nulwQAAZ/y
	ktZPP6LohTfU9u3yekdeRN9Zhw5JTPXndKPMIWP4ZTZPl39CRSKkGmQ24K6wTtVE
	ddvpg8edrCTXMlWpfnSHiRYHxO8cJ9IFoFSsWag9NuJrYQMXuG0MlJ8RXGpLm8j+
	GUGOuqN6cjO8Ly3R2/04h02h+COPxjNLHOM9PZVtKVX1f3Tdh/+7Vr3xra20Wsqn
	eHPAD6B+4p+gFjVPJKeeOp3BxuNhrl5v1qkvfHOMmTtW8iqoyXAEbWpfgxOaNerx
	bxOlU9NumkOl4E7q6mxJvQugmdeQQ7j4YQDpSaLABHgagXr6gLBpSD0kCzxRHHL5
	EE1fiA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav2dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71655aa11so6373832485a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 01:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837213; x=1772442013; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
        b=TZTRsttmSzkExXm75mknLHjoqgsyvpOZYEDY/xz3OJju9KS7uT7FTR1ns0Cfg6FlBE
         vyAVqoGGDwaW2mh5OudykqHxevH5TK4AgV+MVSeozcq2uGJIUT/2+JU50t66XA6IWk/E
         q5gRoYrn1Z7ktZO2vnXrItlUByUkKKN0fhW3QatWLM90WjWyRJhh9t2NjACxSHqL56CQ
         B85ffQFNMnq+Wd2n/YKGIMg9vcC5hczaXJXxEc2rOCB4RwTUglzlxySrMXVCQCcdB9i2
         Ji5iKH9IpD1N/1Ygpl8dxA9be3dEKu5TOxkzImrm7g3hDH0O5KkqOZOnaOerpa0jOz3Z
         SWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837213; x=1772442013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
        b=vnf7wws+OZDD6ofsR/HADoBVW18bUUdKFV3+I0fIPHmn1FjHC+c/RnlZLP+Ei2v/F0
         P+eL3vTpfqIW+gM7Ob1ioCxKXkguFPBRSMTzVmQ2rwx9x9y214PIKhMEUMHa/m+z4lhk
         sOb+IJuf0EdOywxL6Utg/jET4zubS8x3E8DQjjv4hF+FOM6AhlxcJ80BVEXsBtj9MmeR
         QV6UYTMii/0wi9E6pdoizYFQFxR5Kf0GBHh29z2c3c+St36MjETMo/fE6bVzZRJ2EGjP
         rcuk6dAkWreY0boyhJVqlVviOaREDdpRGif5fZjiupZxwlYeeJB5VZjIaeZb6Zt/EWbA
         V6dQ==
X-Forwarded-Encrypted: i=1; AJvYcCX23no4EoEQ8iCAAH9z5FnfGzEhn78jZeDjdJs7aiOMhJv3ruE9LHR+PH73BJipjOQpZ0ucHrh2sTod0A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0C+EffIHPbJ8ZRgnHX3jMTwin/09WpEsbgS2U74WpOyw8Irpo
	aGSmLBeciPfcT8+h2Od5MGMRxngW2TkOgm+mU2eQ0xHITTDpRwxW2+EOcVTbnHMinveerEzfFIS
	1MDg8AShxoxrV9emNF3tYLs+bc8e9eJoEuL5VyMlqL2/n/h4LyQPPXwyHp4JdXnIq0A==
X-Gm-Gg: AZuq6aLLk3PmdDkRm2xkuGG8K3oTYLNVS2bjgP4adibKc5/yj4bESIxmdHhmiL6bM6s
	OXdn0btl3YOYc8k5IPup7uVytZ18sZkFgHaet/3bQ4YdBqxmUGRXX9jOafKZsz183cZLBdxtVF4
	NPwaoecvI2YQJzjiZ7+8MIX+GvEQAep98MrZzS1hKV/+roTn5SvdUqlEEKTFmIVwiFrmrgJ7pzD
	fw3O24c+addIIJioQrytFpn3NEqXg+ECckrlOBc8jHPehEm5LND9zjcYq/K2aznTIl4A74+eMy0
	xSVeEz2xNwT7dW7Ivstnoyz984OVGOj9fL1ZR7GnMLUFgUVXzPKqMGyDuGy1mQxSp2FX9DHWcxH
	tlRSli/74PXsn00S1WCXowBWxYZgLw2llD4oROZq3No+1EFTjeBkZ
X-Received: by 2002:a05:620a:25cf:b0:89e:67a9:fcf1 with SMTP id af79cd13be357-8cb8ca6e5dfmr893388385a.52.1771837213284;
        Mon, 23 Feb 2026 01:00:13 -0800 (PST)
X-Received: by 2002:a05:620a:25cf:b0:89e:67a9:fcf1 with SMTP id af79cd13be357-8cb8ca6e5dfmr893381785a.52.1771837212768;
        Mon, 23 Feb 2026 01:00:12 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:37 +0100
Subject: [PATCH v2 08/13] i2c: ali15x3: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-8-13b2a97762af@oss.qualcomm.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4026;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z5y+uDYDLt8QrBK74QcxPQFJYMWolbieGXxGJWOf/Z0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcEYiK5UQfbNNqKPli3aLyGyc9dDCAApPSVu
 LSNBlM5nICJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBAAKCRAFnS7L/zaE
 w4NbEACQ/tkbIztt7habxCJvYKOkNiHzidkMAis/yUMZwvnw2HpGFGHCIFcmkdnHg0snG26uQ4h
 0M+1oJUA1rCaBIo/sDh+VRpAaMSxZQgwYg3dWej8mpAiT3t+jz1z00zVZ1/DnW0PUH+lh2agaxw
 nvsIfrzaFtUww5SdpThdARVpsR7vCDw4bpz2u1Y9OzPLqqrEewp3+YXh27EsI6WKyDxL0CQsK2Y
 Sb6pdI0qGN0YYYEpZU1xOcnOpfd4Oskb8+Kw7SVj9PlWpfZjKg34Yf7W0RKuf9OLGzjf9UIBDhw
 P8ZhrX1x2eWmWiZnQaUkF6EyhmhxGqbfnp013QQKEMecw/zmvEJds6WY6sYfoFvkgceP3xLxim9
 /jhbVGlEo7jr/FjQs1X0ek88255UcO7PUwflz2vB6zGXoMHjUAg/7QK+H9GE5rZva1whpge1CL6
 DisWCwE0DR4v4MD2gP+Rm4XTJ1ID3W6LjgygBrxIWby8hoO1PYxp4/8hpAjWHuAeDgklOK1VElK
 g2qVJfjeHMCfM1pUgX1wN6je2wLg+vjHdy/noDtTeUBkr1ikXhXpgM21fa/JMFhclnYLx+5JKDm
 BVlk2V0L04Wdt/URrfJ/aSrcxdhtsenJkpzGHNvZuOSKWS7LuTKEVdhDfbFQ3O7JS3EMR8OWiT2
 T5qRX/0rHDZqaVg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c171e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=FH57a1SQlJoUzRel804A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfXyTHItrIsj3YC
 JlsacsiluMfa8IZlyOYGCgFm3ljeoInkNEjRoaUwVxLMuwDrNr5rJabJHVOrwY8XwfzWoujA8Ey
 gnNLzsoB2p8wOvszkiq1aetowXYYrr/FJC5iIpG/G0sZTqlTTZmksqDzTwbljp8ioXEhXt7kJPW
 ph4zRS6CUUbh+67aakj9VAHAjnAMlkvmlzH6EJnLK6IQMKLkE4SAHAHiDicHETqKxllLt4MaU+F
 23kErQseXsGNcGw4311RgB0rueswyTKgbomSh3osu4W5io1ENCaCFgdagesLdigZ+fTewuiPlRU
 /+KZdtAsDLw4vSFyp6MAA1tgJkWZqKoocXM3rf9hRVvGnNgiXen7rxzlX0HajsvhidhquK7txzi
 LCHFf3mrEYOTOV4ELZnegc3iK7aNzJlohEfIhJC8oP8X9gCjWE0rN0UhmRx4SUHZ4Z3RkDQwryR
 z1mVvSPBPKrU98IRyDA==
X-Proofpoint-ORIG-GUID: t2nB6fLTf1EYJr1cVF1lNPf2kaAKbmKl
X-Proofpoint-GUID: t2nB6fLTf1EYJr1cVF1lNPf2kaAKbmKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-ali15x3.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 418d11266671e314aa2fb882ece025dc0ae998da..bd62aa8d645004bef121fa46efc1d7afc473332a 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -223,7 +223,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): STS=%02x, CNT=%02x, CMD=%02x, "
+	i2c_dbg(adap, "Transaction (pre): STS=%02x, CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTSTS),
 		inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
 		inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -255,7 +255,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	   then the BUSY bit may come back on when you try and use the chip again.
 	   If that's the case you are stuck.
 	*/
-		dev_info(&adap->dev, "Resetting entire SMB Bus to "
+		i2c_info(adap, "Resetting entire SMB Bus to "
 			"clear busy condition (%02x)\n", temp);
 		outb_p(ALI15X3_T_OUT, SMBHSTCNT);
 		temp = inb_p(SMBHSTSTS);
@@ -270,7 +270,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 			/* this is probably going to be correctable only by a power reset
 			   as one of the bits now appears to be stuck */
 			/* This may be a bus or device with electrical problems. */
-			dev_err(&adap->dev, "SMBus reset failed! (0x%02x) - "
+			i2c_err(adap, "SMBus reset failed! (0x%02x) - "
 				"controller or device on bus is probably hung\n",
 				temp);
 			return -EBUSY;
@@ -299,7 +299,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 
 	if (temp & ALI15X3_STS_TERM) {
 		result = -EIO;
-		dev_dbg(&adap->dev, "Error: Failed bus transaction\n");
+		i2c_dbg(adap, "Error: Failed bus transaction\n");
 	}
 
 	/*
@@ -310,7 +310,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	*/
 	if (temp & ALI15X3_STS_COLL) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Error: no response or bus collision ADD=%02x\n",
 			inb_p(SMBHSTADD));
 	}
@@ -318,9 +318,9 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	/* haven't ever seen this */
 	if (temp & ALI15X3_STS_DEV) {
 		result = -EIO;
-		dev_err(&adap->dev, "Error: device error\n");
+		i2c_err(adap, "Error: device error\n");
 	}
-	dev_dbg(&adap->dev, "Transaction (post): STS=%02x, CNT=%02x, CMD=%02x, "
+	i2c_dbg(adap, "Transaction (post): STS=%02x, CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTSTS),
 		inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
 		inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -347,7 +347,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		temp = inb_p(SMBHSTSTS);
 	}
 	if (timeout >= MAX_TIMEOUT) {
-		dev_err(&adap->dev, "Idle wait Timeout! STS=0x%02x\n", temp);
+		i2c_err(adap, "Idle wait Timeout! STS=0x%02x\n", temp);
 	}
 
 	switch (size) {
@@ -404,7 +404,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		size = ALI15X3_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -437,7 +437,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		outb_p(inb_p(SMBHSTCNT) | ALI15X3_BLOCK_CLR, SMBHSTCNT);
 		for (i = 1; i <= data->block[0]; i++) {
 			data->block[i] = inb_p(SMBBLKDAT);
-			dev_dbg(&adap->dev, "Blk: len=%d, i=%d, data=%02x\n",
+			i2c_dbg(adap, "Blk: len=%d, i=%d, data=%02x\n",
 				len, i, data->block[i]);
 		}
 		break;

-- 
2.47.3

