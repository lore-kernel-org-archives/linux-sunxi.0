Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FC234EF08
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837209; cv=none; b=Hk6cmf7Exq7kWYQx7qAjakMVO7wCWEBW8PvGcBwbJhgcFnvcrH/uL1b66enjVJWpRAiEVHu7fVWc0zRktqqd6nEhZkiUF+Y5gvlPP3yn6lwMhrqb0eZMPOSf/b2o2YUw1QdF1ZcfY8/p2jwgHCxfexlFKNOwAwUJBEdiRwUaN3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837209; c=relaxed/simple;
	bh=YO+5s1NixQKVQ+sAM+FPc6Fk6P4i9sqW1J3IBeWikPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fRq4vEdJcn615LiVxpEtVkLpLBiGivBEhk+cpS5a23LY4cJIbKxhFqcihjb+djSdr/yvUl8n6CDr1RWgKCgg8b8xdlLtAn5PHLm7XJMZEMKyNKVser8KvOTeZ3GdEyL30ODIEake0cz+20iiQkPnryCgoaHnoe6HV9mg7znitqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqVMtq+t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzMYJ8P6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqVMtq+t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzMYJ8P6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N00Dj23424203
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T2tWxQkR7+OyPEgchhAczL9UMg2ii+knA6PgKAdoffk=; b=NqVMtq+twfczC/sc
	BwttqQQL5StjbFbLr//QuB0+TOJut7qV/VQB+NBMZkjtTVI4sbR0Il1x+OMAg7mv
	IoJVxVj0pMUHqSURupsBor9GQry7DNDOWmuK03xVzsY7aQ0sQvnoCvOFZGxLE9Yo
	DwZ9crgcdLy50eAkmTPD0YRUKjOhMwEyTfiZHFGAW0iHO3XSTcuTTBwzI9itV3/T
	wtILadGgeCeEKCEBI6PPyq+42q/PcWIhtK6THciR/yg7gxBcKLv0Ti99TNu6lndh
	LDlHEiwWLSYBk4mDdsDcnsffWyTE1LXANwO1zZTUY4978bHcQE8/vcsLsUpx4rk5
	VqG0Og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk405e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70b6a5821so3431644085a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 01:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837204; x=1772442004; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2tWxQkR7+OyPEgchhAczL9UMg2ii+knA6PgKAdoffk=;
        b=LzMYJ8P6BjdNcaePpKv0Q4G8P4cjOINC2sE5SPd/r5McKAFKvJu/9s4bJG50ctFlOS
         H05Gyn+TUiljkhmtuXEDtTJlra3uVoFjM10TEcyBDPzun93m4GH+pCorWgQCTzanC1GO
         LVAXD6LDGrUktc/TD2Q+UCtO82X2LyyTU32qe928RqghpkDSYnQ98ez0vDyl4+IXSPnf
         83OCWPh4sOmHujAMgedHcOuRH9elk9fkguLLwDkPa8MywUaMDVh7wZ0Y2JwlWmDPMLwm
         n4jlsaqXIv4qjdCatk6ulo3xYd+hfmla9e2tEv9GNoDc4nYf3qPMZqjux0cgg+qFjU0M
         WuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837204; x=1772442004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T2tWxQkR7+OyPEgchhAczL9UMg2ii+knA6PgKAdoffk=;
        b=oY7q23dUBUWWNMD3k3B4PbyRaMkKeRAWKfIZsBjUAT5bVybWsPL8rIf86ZygjLJSvk
         H/CLnFOIkMlHP8zxgt7Q1o8kjT8DoKB8Z0HgK+XTRpoe7PWQnFmIw2n597wyFqFSEWLj
         TXj4BJK/KvKclc/L87DSq9t4BXeQSoNYqRL8oem7yj5tq8WOqtYT4Hc5F9I+c/W+TTEe
         OHlHcQk6aR7WHJ3Ip3HWJxtg2oSXbjJcVtNZpmUFl0bqiaDNX+Iu5hF85vOgtvkD9TxO
         06mFwP7pDCmIHEye0HtifU74KTxFxpisbuYwCTgSY+Sl0BKGd+NM94jrpjxT+/nDo23H
         1Waw==
X-Forwarded-Encrypted: i=1; AJvYcCXtODfBF/n8+SFMNbGPGuEb+uMGld5RUIgkS6+cJqLZHW/rwxQ34ey8UoxFnJ1um1qcZiI2WgDI/xWjug==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl/ceExVSJCZ2fGBtthCFy7aA5SjCYORR5IbXxv5fkAyJ3GHQQ
	CiAvumk3sZbG0wZlMB1agAwhp/XhaxfG74vSRLaDUyFvHdLnWJ+z/0dNgWhwHlmwFxkQCpHeE1o
	U0CRTRi2XXoBURlviOGY01ITc3fMhyDUUmw5n0JafV5cAY4RP1Wtxuke7BDXR7aEqrQ==
X-Gm-Gg: AZuq6aJpLtMKrt/VIaHjmMIlEzFK76h82GS/rMtVC6mpAxzQDjaKydsZ88BIomv+U4w
	4BBLVTNLmvAT4jFPAYUKztt86OFH0zjRZokRbT15XKXqW26T3GJkbgUzunjOhi3sT/mah9aK4nB
	rLD3+I9BNJ0suhoZYTOK7o4GXhhr8Beou/Gn7OiVJncHXcEA2XiHOOUoGLl86a4gsB43y0X/3TG
	0o/z+NFrqK8RNUpaAcP5xhjdwhKa4EM8kwtnWdx3yNxg6HnnLxqAR1lEZcfqJMoU1YBnhJs7PPe
	72FDlIWWmkgEQI1wB0x/WnHFQlb9W7G29cOhPLAOozjKxbZVOU0qhiHCo0ooZUuV6tUR1w1l2b6
	8RZE2u9+kBv3sCj27eY39i38ufjOv42+HDTvjFnVV+huEten19tdv
X-Received: by 2002:a05:620a:f15:b0:8cb:4b1d:e424 with SMTP id af79cd13be357-8cb8ca721c3mr884734285a.45.1771837203916;
        Mon, 23 Feb 2026 01:00:03 -0800 (PST)
X-Received: by 2002:a05:620a:f15:b0:8cb:4b1d:e424 with SMTP id af79cd13be357-8cb8ca721c3mr884729885a.45.1771837203404;
        Mon, 23 Feb 2026 01:00:03 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:33 +0100
Subject: [PATCH v2 04/13] i2c: mlxbf: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-4-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3690;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YO+5s1NixQKVQ+sAM+FPc6Fk6P4i9sqW1J3IBeWikPo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcAnPQSTaMLTTpvB+xaAFz/B8dcwj5+aqUFR
 iA84Gjv9H2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXAAAKCRAFnS7L/zaE
 wyVMD/0SnjD8uJViNM3tDR3CtAnfjAe2U4Tf7D9+q0NnRBNoXRo8sg9cFIL6nR6WVpwvicqFXKD
 LBpoXfdHQMtJfC+b9ppqw5+DNYXMG1syx6rrkvpTGw5Dd0DK5EhAafdd9+VmVrktPCBLDLnzWbz
 jVpCHba/RMWLG+wQe+Bal9ZZxunBPXcvJuK/xmpkLd+JbvqHr34az4mxrCpDk7ZKsFIBs3pd+2m
 H+L63R6NlUKQPd8YKdxgzD489rrVNkNagWDEz2DMOXRANIPSlXLYZOQn9iYt3zu9Uo8h4Kg1l2V
 OewXYuZ63w0J08ozkHp55Vlfg/jqmpuBg0oifaxNc3t2zCFx5ykBJ/9f+Pb+aLPjPF671G+48B3
 g4L5GdCTdn1lypk6SK8jVYIwcTZEcvXPY9uYi9lgiA1mOn9w+iljoViNBJRtC6JAO7x//pW8DA8
 +PKSUINSOaw101BElBgFemtbN4N4879wZyEaY+RaXvwloqTnMrDnpmi+rcbTAoUXUbGMYWmkb1k
 8oqCYSA6I+bYfIAguWYtxgGUgqrxTir+Ky4rKJUijbzaf4RZ2Q0JE1/tssdWWLrFNGGHnIbLe1H
 x5Qr2wdSOwBaRH5NI5StZsRBmoGHGlkxiDzz5o/csfoCE54SK1XtUmhVRnLZxDcWdKs+9gEPBqp
 3zY9ucoq7jzm3xw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c1715 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KSXH8CamUCXRpb75a7MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX2yPoNnqEXaCt
 w520DqAwmFXDiiYZfzOkFuVEpdxJCtN4g6K8t+cZ+m7OLG0XcqrbK3X/2MbxPd3PBv0FNdC/wSa
 /XKVPzxxDxl4A9GwiaMEIdE6bL3e8b4L0wM8w1mCjaTQkxxzhBeoVLqpFz1XIjoLiqdMj2d3g7N
 k6KSOn/MpXU96A7WDjcMnrs0u0m9P+/LD/fL7RdV3n2tOMIVWB5u7xnIlSCZV06MStLqwai7+MO
 IU87tbawrqdlZdtE9f+HcIGtamsAYj9QA+EkAOKDgt/6TB40o+5VjkITa7xYuG4ihDMJpr23gWp
 DazDSmYhuPAWTKMWFJ1IhOP47tDcjRYLmcbxDXHYaj3I7bMFz8OLbIQqI0zq0qpgPstLbZIKOcE
 wad6HRHbRmG9J1MFXbgQy+RsMlCJr54rTBMyeOV/Mklme4gSY4EyifjkDhOOwaOGzKk0IcPtzs8
 fLJxLB3xYU74z0Tj+sw==
X-Proofpoint-ORIG-GUID: J8khPRvR83nOWwgSQctvXUhRzNuVyjAd
X-Proofpoint-GUID: J8khPRvR83nOWwgSQctvXUhRzNuVyjAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 6c1cfe9ec8accefaa3f95424393953ff3b869ff6..1dac73002220920ab8f954b29fcc809c6451daa0 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2038,28 +2038,28 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	switch (size) {
 	case I2C_SMBUS_QUICK:
 		mlxbf_i2c_smbus_quick_command(&request, read);
-		dev_dbg(&adap->dev, "smbus quick, slave 0x%02x\n", addr);
+		i2c_dbg(adap, "smbus quick, slave 0x%02x\n", addr);
 		break;
 
 	case I2C_SMBUS_BYTE:
 		mlxbf_i2c_smbus_byte_func(&request,
 					  read ? &data->byte : &command, read,
 					  pec);
-		dev_dbg(&adap->dev, "smbus %s byte, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s byte, slave 0x%02x.\n",
 			str_read_write(read), addr);
 		break;
 
 	case I2C_SMBUS_BYTE_DATA:
 		mlxbf_i2c_smbus_data_byte_func(&request, &command, &data->byte,
 					       read, pec);
-		dev_dbg(&adap->dev, "smbus %s byte data at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s byte data at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), command, addr);
 		break;
 
 	case I2C_SMBUS_WORD_DATA:
 		mlxbf_i2c_smbus_data_word_func(&request, &command,
 					       (u8 *)&data->word, read, pec);
-		dev_dbg(&adap->dev, "smbus %s word data at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s word data at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), command, addr);
 		break;
 
@@ -2067,7 +2067,7 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		byte_cnt = data->block[0];
 		mlxbf_i2c_smbus_i2c_block_func(&request, &command, data->block,
 					       &byte_cnt, read, pec);
-		dev_dbg(&adap->dev, "i2c %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "i2c %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), byte_cnt, command, addr);
 		break;
 
@@ -2075,14 +2075,14 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		byte_cnt = read ? I2C_SMBUS_BLOCK_MAX : data->block[0];
 		mlxbf_i2c_smbus_block_func(&request, &command, data->block,
 					   &byte_cnt, read, pec);
-		dev_dbg(&adap->dev, "smbus %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), byte_cnt, command, addr);
 		break;
 
 	case I2C_FUNC_SMBUS_PROC_CALL:
 		mlxbf_i2c_smbus_process_call_func(&request, &command,
 						  (u8 *)&data->word, pec);
-		dev_dbg(&adap->dev, "process call, wr/rd at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "process call, wr/rd at 0x%02x, slave 0x%02x.\n",
 			command, addr);
 		break;
 
@@ -2091,13 +2091,12 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		mlxbf_i2c_smbus_blk_process_call_func(&request, &command,
 						      data->block, &byte_cnt,
 						      pec);
-		dev_dbg(&adap->dev, "block process call, wr/rd %d bytes, slave 0x%02x.\n",
+		i2c_dbg(adap, "block process call, wr/rd %d bytes, slave 0x%02x.\n",
 			byte_cnt, addr);
 		break;
 
 	default:
-		dev_dbg(&adap->dev, "Unsupported I2C/SMBus command %d\n",
-			size);
+		i2c_dbg(adap, "Unsupported I2C/SMBus command %d\n", size);
 		return -EOPNOTSUPP;
 	}
 

-- 
2.47.3

