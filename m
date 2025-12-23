Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2FF337699
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484183; cv=none; b=ePA5D5TM2DKwSpXdscOojnlEZbUH/WeEN3Aqp5WN+5qa/gCtu1yp3xByCPZGz6LEOCmw5GEOb4TQ584QpbyntW7ezr9MthWE/umjmSBs4FIcDjpjD1qVlUvhASTTUIGX+cNdBT9AXSeddSLV8Rut7reN35C95MepPrVWUvOSdxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484183; c=relaxed/simple;
	bh=+nrztrv3eun2Q963Kt+vOIIxHNHM2moiogYKDHo0wls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DoZ9XYAMJfrtf00dMHaJFb8FNvviTqmvKqkmlVn2M2y/tljRT0olMJAv4Xpl610ypbYJdUN+93itljL840zwsBTqVcHfP3CPDr7cikYLEz53qshaYm3t45ea2gUWzMx3d9gUbhoPyUEUXA1clJNhfQ+LVVb/Sb1cN0cEzlQViPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otwKbrxf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T6qUyyso; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otwKbrxf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T6qUyyso"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9q06A1889226
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=; b=otwKbrxfnL1TdBVC
	6WV4xwy/B/sUn11hn2Mc7GzTZGP3XqRyJ5xnM73dU14UKE6XUzKF6qaOA7b8UEXK
	wSt9BHWtZNlMiMqr+qTAO3he9wMSD+YQNzdxZer8gA15KLv+c4456bAg/IZZfHnr
	Fq8YbT3WD3s5fO7LpO67NGCN5mpvRZwDQIXSjD0Z/B5cvp1Ygi2DcajaNNdPYoE7
	5nvRXV96tuFd5JVvItjtJQQkmzvkUIA2XJGDrN4a7u7Q/dHDPv6JpY7FcQALcT5B
	JPJ8jK7uAUGPWRb6dmtSPb3MEN2s3nBA0y9pYNYuInrMOwwsM2aK1Y+nLM+Pok7P
	IYkqmw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770ak4u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ff3de05so136994021cf.3
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 02:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484179; x=1767088979; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=T6qUyysoG0VOr0G/AKZ4H5Gku5dEnkjp/mWdIRz4pTvfTw+j1db6/Q/PxS/vi5UpU5
         tf9W67PQ4G5ANibNJ1v0frpk8tmsN0IIOqQwBWQxnjw3iC0I9mV3G3fayk1nKMFtZGsG
         TjFSa0VKaxxSdRzaxCmF7Jpu0dyvi5RpO5/6RkYTiLDEJocIO3F1R235Xmz4EazIdq+F
         wEpTIE/RxYvF+xiCOaMun0DSlNbl/s/3tyraCFn7pBtInnU2kL+0gOldrSXudCFKX3BK
         AQjqMBX5KDEXztcIQ3JPZGSaIVKY+mdQIx5daiWoyZ932lmRr3r8aOSbpJVDXaqYMrCc
         v51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484179; x=1767088979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=ohTJ/Uw4WKoY4mukgZrYgpzLkj6rxCBgkULnkltHBo5ZtvZkmzSvO/Mb1ygwchdO5c
         FEKxVYLJ9PIIsaZ698X2izyw2/Lt0hWIS9q2NIIWTzhFICdr8NjGyqK/YgipTe9S2Dpw
         uErAnOiDv8DV+vxuVOX96cyAC4//VBd8X7m5cC1pa68zerXcNNQHmI0JNzBgW89egmMQ
         8zWDnpc2MSboMmMUxaOiQ9jG7zSL/XIEqZoVnUAD5tiuzJHaKKzDHbpbSY8flc2hRjVy
         wWp8oLvfFAIANgTSNZjC8dhD+0nMOoQiNBcM6dQtpPBU/t29fxOWDXLVfAeDin7X6uDC
         x0QA==
X-Forwarded-Encrypted: i=1; AJvYcCWDbT0lDRaYasudXyLZvAZV+nGlhs3CWdj3FsFBaCYGA+6UxBbeZXtMTg5TvG3JteETpq/oyvnqmqco7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YybKeuM4ePg0grFt3hB3XlEIPgUsSCgIKlBUr0Qsok6EalEQdkL
	q28QkIeMDnvbOIp3z22r7dRuB32pCm9C+sbxuW3cYptb2Syx6kLSiS81LimLnLGnbiymmx9rVj5
	NncwS31IoMXoESFfvx4YbNbupR5ACIn0dWLd2CAJH44Lqr7nX94T+JkTkyzY3Vc2XaQ==
X-Gm-Gg: AY/fxX7tfNbSghzgdWIPt6A72s6VkiMP46JmR/olIAbvG5ZFFS8ixn+fEsTM91ZOjJH
	cFha9krA2nm21sI4d52VtQbJsWMTh4O6M69GXxFhrQOdyVeRH/1Zs6/a21UromfIIDZU2tJdm16
	y32FMydI0ir61yZMX2Fz0ZONevufuZcOAkmTZZ9mpJJgOJ2sx236B40nwzcVAvxNM1YEUOa22Xj
	hL5XjnqMyBrIDYFeDTDv+pSVhZtRREuJ45y1lYIb/XBes1aHcuKQiFU/29Zivw5ZPX9DqCrTMzm
	bIOPo0oRyzFOQxldh7So0nDXCEnmShJjW0US6OGVKuWUlVaL4pJU00CkCHFxU7NR01N1/IBrrxx
	qL2fxTpa4JZnjYaqXOMkm7r0Dz7MEb13zhiAnkQ==
X-Received: by 2002:a05:622a:98f:b0:4f1:be95:5a4c with SMTP id d75a77b69052e-4f4abdbe4c5mr222266271cf.63.1766484178976;
        Tue, 23 Dec 2025 02:02:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYXi/jHhONsfaUYfyqVZi+bmTDlvcyn169B42+SyCfOiYjgT7JBB+81IGnemThpNA20OAzag==
X-Received: by 2002:a05:622a:98f:b0:4f1:be95:5a4c with SMTP id d75a77b69052e-4f4abdbe4c5mr222266011cf.63.1766484178619;
        Tue, 23 Dec 2025 02:02:58 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:31 +0100
Subject: [PATCH 09/12] i2c: owl: use i2c_adapter-specific printk helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-9-46a08306afdb@oss.qualcomm.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
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
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+nrztrv3eun2Q963Kt+vOIIxHNHM2moiogYKDHo0wls=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmjAhdbFloNWEKAbQOt2D2f5/84o4352KnQVG
 qC6sU/ezyyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpowAAKCRAFnS7L/zaE
 w7epD/9rDuuAuMrijZz+HznnGHSdCAeNvsyqHlql+M1L3UpFuJyrk4GpvYgN1asIGCxHuiIFf1f
 bXtwKF9d3aIJdQVpRiUqimlYz2hnFRxxS75WMWMzENRiho/uW/5Eqt+0cy2tDr/0s5hx0L/A0su
 +GlAUQJjYyIMHUuHqFGK5mnOcmufBxbSXsae+2b0qsOkJufCrsrrSJYqKOp1taATIiBemTJZBpU
 VxbKBW0hXg0LR1fhLovLl1CVuOgukNLNVQqMjcTwe7GqYQ978CIp9weEtETbxvuRelLQJynHcSZ
 KL/6FadBg1u2JjG6wfiUDTij0xfm+4hCrKIkVPrqlxOSOMGUpLzefUV0l/maqjvOgQ0LppSNR5X
 A934pNHJp/+0V5FSaHBftfwPWbxFQXdbRFgAwfkGkhposEp+iccTtfHyhJXgYcCvmoMLAn7/cfL
 NAZQ46Hi9rWpzZm5iYEHBL+Bf2/h9OLBSHlpbfWDLqxzMeGEI4hx1bLS7mba2o1qCM/5rln6Gj6
 mcT0wSiIUGkhRD8ScfYZWZDeU5m/ZMu7UdZko7fXjAuwqBiTEBJssvjkaKzVeh+47B/R5rCi5tX
 6RP3KTEzVW0U0Mrk/v1FkjrmB+jDbxnBnhc2dGQqllDFHvfAFCbO1KYYTpv+84WgRnGB1qad/uE
 eSV/XsXnlHU5OnA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX7KvI5H+LNoyo
 Spn+JteNa5S0JpkpVrH0/fSJv+AL68x+r3XhZiuWLorl/vawOWyjCtRGJ/kSmdqQT68Ei1ClzBc
 s8fPYkp8+DRXEZTEopmcozrVwZVMFjpcO8NScgWVzSixomNwN6I7uXkYUKV7NVUaxvMKscWGs1P
 idVcoJsdp5y3Y97FJwzASeuYaopoV9VItZITyQKh7HZzqX2Z+ElGi8q34BUENl4gxtwTnnjLzx6
 2CM/TyadCqTDnjzlZip0v29lVGAohHpThe2ZDPMEsbAiXBlQH5yd+K1jQ3VUF+Hxa0A/c8iweJI
 bSw00X5uWjzhEuj98BC95FarsKKd4AvGMKgZwXx0ylUfWCJU1rWWBnHe3aJLu3kKA5njth5Cj1h
 K1kMxc0XbVNMCCMd8wfW0dazCyfGt14vefpFY2ZYYpaEUnkdi29OPG6MFo/4c5B+HmBBivuqVWg
 Xg+yeueHfkkWY0MQxxw==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a68d3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=td_-LIo_6SHiI0BopBAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: lVz1xprYoEt3-Jags-BaBALqg-NwrjRE
X-Proofpoint-ORIG-GUID: lVz1xprYoEt3-Jags-BaBALqg-NwrjRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-owl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 84a195e358866d693fb6d435a5beaaee640fd2e2..17718f15a0f1fd238bb4a6f23dbb4f9696969ed5 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -241,7 +241,7 @@ static int owl_i2c_check_bus_busy(struct i2c_adapter *adap)
 	timeout = jiffies + OWL_I2C_TIMEOUT;
 	while (readl(i2c_dev->base + OWL_I2C_REG_STAT) & OWL_I2C_STAT_BBB) {
 		if (time_after(jiffies, timeout)) {
-			dev_err(&adap->dev, "Bus busy timeout\n");
+			i2c_err(adap, "Bus busy timeout\n");
 			return -ETIMEDOUT;
 		}
 	}
@@ -383,7 +383,7 @@ static int owl_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	spin_lock_irqsave(&i2c_dev->lock, flags);
 
 	if (ret) {
-		dev_err(&adap->dev, "Transaction timed out\n");
+		i2c_err(adap, "Transaction timed out\n");
 		/* Send stop condition and release the bus */
 		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_CTL,
 				   OWL_I2C_CTL_GBCC_STOP | OWL_I2C_CTL_RB,

-- 
2.47.3

