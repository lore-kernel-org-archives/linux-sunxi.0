Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBBB254849
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484186; cv=none; b=GgbVkNqN070vc6WEIrOE3io08iD7WLh4+cwXuzvn6o8UCq+xDCg6Z9b/fWRArUFQMK0t1bWc97zejBucVXxev5oqIrVNYJMAQpeZSSGnDawbtgWISl6e9DHJDpkmH72ueH5JwQ6petLYqX1+jEDvkOrACrvkYMjvXrPNOLgNNts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484186; c=relaxed/simple;
	bh=1RcMgKhoVIDH/uvlkjR4k8BRDeSqy3Z1wqmJ/Zg7uPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbeYzLeouXKphwdhdP7y/QxgGr+xc3Vt2bkctNjep//vVbbEQJcclGi2fSZ5h8dUdDboOmfA5i86ZiMo16Jd6C6lEinBGIzpYlSMl+UAOJkHVVjJOsKN7tyeSa/RlqgKoxoduT+7l8N8BoslgpqVsgsMxDS2aQZC+0owdo+RLv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgtVVrCR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UU4H2Z7F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgtVVrCR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UU4H2Z7F"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN3idED1357329
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kn07S0VFJ00r1Opp95FLhCfso4raJ3godCnzzNkTUdQ=; b=lgtVVrCRDEEhbVLA
	bu1fxLTBApMnXU4Io5Rs7UxlEpP4lv20AZm80EjrI6PAMZvpCBjCN/RrpU2aydOL
	g0vyT5gMOrqNJiYyX+5UjqmHbGn8dMJbc8BplkwFup1dzZnaRiKrxV9wmSjanO+5
	DAV8tqUDtGipXSWN/91KJm2nSQtUFCtkt+YZ4M8XDjdSA/Nrb8pwgRj3S1RPeblX
	O2ENydHSe6u8kcw6kNgqkiKc9x8rPElPzUPsxhK41Q0bMN0QMNciQW9HOdMdDHzq
	QZlmEU8TXuKRxRf76vttD6biAOOikTeEIAE5DoAFlKqjR/y8mG+ajwHT1pavw7Zi
	aYLMgw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc2sm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:03:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee3dfe072dso126991671cf.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 02:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484180; x=1767088980; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kn07S0VFJ00r1Opp95FLhCfso4raJ3godCnzzNkTUdQ=;
        b=UU4H2Z7F89sjN5JZD/YLhp8bOFl2RNENyBxYu64RwA3vXhswbVIjr1SRgC6LwwsAku
         AZfXe+wYzPfftot60DcvtULB4C9gLCR4FRbu6S1rX3v7ujaBXAgfr4R0fLwtoxxG4Tmq
         kRzXYDUXPVBoW8NJ9YljQz06XcTxLTWCbleXAcgcncN3DPCaZsPJpbYvIJLt5WDhqmcr
         gcWheW2tvpkHStXt4z9dAi73WExXUP+0UpzGcnODVp7UUr4l7vdW3uolRV5omgRazjAk
         i3v99u3gFTTGYtdJpl1nMR3KdkgVRN1NVU6TnAVobumrCTM3JADOgQ9hmfVNAz1vAeh6
         ycDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484180; x=1767088980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kn07S0VFJ00r1Opp95FLhCfso4raJ3godCnzzNkTUdQ=;
        b=wZFs7BN4Q/lWcShwAVO5pqhAND2WidNS61nOOhNlLlJdYhvveqpcNfS12K+CwIlYA9
         c66yD0L5QuMhD0WpXyeAprUTKjyTRLtZEs+7tMrA0Dj67C3quxnyPj/8BLzlOqtxWEN4
         gSaO+qy1pbAFrm9KzyW+b7NJQKtcxtFTN7jSVxmUyPDuq6ZNQ5i87CN5+2hQ201CKzUr
         3b8OU8iH/4L+j1BNtp4bIW4DFHvFcckthKcYEA/vH24wTk5jPgLp3lCj8vIrpebFP85s
         1TlkbVjzSdwfL3Ox8cAiCoXJq8g8YX49gBUrR6XpVqFW4Fb+C4ym6GLZPWI96/vd/3z7
         4XOw==
X-Forwarded-Encrypted: i=1; AJvYcCVd/XcPSagbfaQ0sZYLWo2Ld/lz0gPMillwgiBqrw49DH+An4/An1lrC83njwTr3VYTbB8GbUdSBHwzuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAvqecfYchd9FRu4VbRo1IYw515bQUpjLFtusncQA+K7P95e4n
	eO6JLuMHjxPCBgYVs0Q4LR8TuePDQR7WiyMq5z16IrcJWINZsDZbnR9elPw+IOVkbgQvtWoff3W
	IriplQZE+DDi+0jckv+rbVbilo11U41LxLnQfsipBqZ7WBzDbMQC7MbJtj9u9okWqfQ==
X-Gm-Gg: AY/fxX40cmMMN7GgkNtLp2nt2FLe46xh4DeB4Rj6p7Ntvb/G3BjfARbGQfO3BVgODzY
	D0Aoi1wFEXr7JcQwqJSr6FRA6cFVAR1mS8RuGc3RsgGCkazPU9Y4Vkh3USP6oHa/+Kzv7UvDavb
	FdNggZ+CWIwzUtUmGeOdlypZyFWq9t4Qg9ZaxNdZg2uuHMOkm6ztsnUp6yUAUowQXGbS3Hj5mHQ
	IsHf90m9AqBsCv+s43Xfw0d8yKsSZVKdHlOYMXD4D9mbH5PjP+tLUVl+e533vxfV6hZCJXmwv21
	26H2Qfny4RwDAKifH5qXX/1VYHLhU5xSSCTQtp9/ANw9qx4ANQgWz63UimKC037+Wh8fmPVNtRO
	S8GX1u6bVSDPEvYJafml9OXT87tYNT20WW0pnuQ==
X-Received: by 2002:a05:622a:250:b0:4f3:5346:5d54 with SMTP id d75a77b69052e-4f4abd78d8fmr199055521cf.50.1766484180400;
        Tue, 23 Dec 2025 02:03:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb/XwjqmlNu6biskXJYdXx7yRjIVunYQjmGPYAWmA2yv1ld3r5jkFpRaOKuHbmJJD/SAxQsA==
X-Received: by 2002:a05:622a:250:b0:4f3:5346:5d54 with SMTP id d75a77b69052e-4f4abd78d8fmr199055071cf.50.1766484179952;
        Tue, 23 Dec 2025 02:02:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:32 +0100
Subject: [PATCH 10/12] i2c: nforce2: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-10-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1RcMgKhoVIDH/uvlkjR4k8BRDeSqy3Z1wqmJ/Zg7uPQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmjAWS6dV2oSrIJN/8EGc+7W8i9AyzXFZaPPi
 mcV5IzVlFiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpowAAKCRAFnS7L/zaE
 wy0dEAClg4CncFPQN0S3c+U7UOudBSZbQgLmP6HOhyUtZ3U9OLbCsKadAQFgEhSwX1jECTm5dNF
 0RdoIoG+fF0GCw60nKZXgiUzxNUalzHyZjn3MgzLiNqR/BAr3Fe55XuV4sKpYT6yU1xAZ1D0AS0
 WB+Cuxnns2XBnbCeu8KX2+jXTE4EspmlwPkIwNTPlrAlof76u8Fyj815z/OQA/0uApNYkRudhth
 8X0O57dlCLpgrWcFelojmLpkvLBhwA3ug9kSOZS5GlNWt9tC7n8yEBuUGnu8+MG+yfjadZSdiGY
 FI/2l6PvAgagfWA6020GUjaUrTrdzHQr57t80WmhjeCdzxZht4XNHlQGykb1O4pHcC9FQoSsK1/
 Ua5Ilo556Drv7i1I7H8wPdl3MyXIb2mphWJCjOR3kD/v2xvLIqwnApfjb1z+6ag9RZHTuZBzsch
 h700sSioPBCeNDSEl8K/MX2Q6LnXgJHDfoXh0dQWUt0WV2kziDw7ZQCFJMAL8MU11fniAfWtnLu
 0zkk4hjESymk+Muoy340vMIrgjGBzwhm/KxR9h3yN2OPcYeZBQ6RTKGDc0TXwrufHCZ3m2YcYPU
 zB8cbguyyVBO5QUmGddwtTBc2xiWqtP6i75lMrsX7aWcquTAWMGnXWUt2zTV+fbXqmMuyOwazC6
 QswEw5+ooZn9yfA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: I6TIB33zmEU1nmJT_TkrBMrjefgowARq
X-Proofpoint-ORIG-GUID: I6TIB33zmEU1nmJT_TkrBMrjefgowARq
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694a68d4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ULAvDvZivfA9C-ZB8fsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXxm6115e/Wn9d
 /MVRyx7jiGVBsXvAgJcN0sp2Va18o3uGk8gmqiL/XvFO0rLsthjuAai7shhPDOh0tvfifnYWG03
 jGW1aXwEUDO2VTwxOkypRRdEJhjgnwx9kM1pso6tMTZDcBAzlaxMx+q3yfBExAbhuAxuNh/DKyi
 uaplTiBtEE/NMsCPdKrHeSehq3cpn7rwXgNR5bqk4qzaC+EcHVSa2d3s9/G8PbLk4gca0l0qf0H
 fwJsNDrj4xo5Ol9USsB6SUxqGnoYja2tlT0YbwysOguj3oOaT274vIkrzi6b+GHyR1M3Tjv//+G
 vM/P9AAod0WkxHAFgRSLOvUIbVH+UPYJFJRxz3KLePKw+vsdPdIL8uKb6nWI4DI+4gSnsvnu0cj
 RhN0ow6MjpSQlQ1WZp8D5Mu+r6woqv2QTNKtXyYg67Zbe9d8g9DpYGuOz/lEphI1AXBGRF4R+Q/
 uxooEnDKWB4ZRHRu7Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-nforce2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
index d58a308582e47650238312537d2d721261d3bca4..2fa6f1dbd27a92c2d67915775e588e4bab675d76 100644
--- a/drivers/i2c/busses/i2c-nforce2.c
+++ b/drivers/i2c/busses/i2c-nforce2.c
@@ -123,7 +123,7 @@ static void nforce2_abort(struct i2c_adapter *adap)
 	int timeout = 0;
 	unsigned char temp;
 
-	dev_dbg(&adap->dev, "Aborting current transaction\n");
+	i2c_dbg(adap, "Aborting current transaction\n");
 
 	outb_p(NVIDIA_SMB_CTRL_ABORT, NVIDIA_SMB_CTRL);
 	do {
@@ -132,7 +132,7 @@ static void nforce2_abort(struct i2c_adapter *adap)
 	} while (!(temp & NVIDIA_SMB_STATUS_ABRT_STS) &&
 			(timeout++ < MAX_TIMEOUT));
 	if (!(temp & NVIDIA_SMB_STATUS_ABRT_STS))
-		dev_err(&adap->dev, "Can't reset the smbus\n");
+		i2c_err(adap, "Can't reset the smbus\n");
 	outb_p(NVIDIA_SMB_STATUS_ABRT_STS, NVIDIA_SMB_STATUS_ABRT);
 }
 
@@ -148,13 +148,13 @@ static int nforce2_check_status(struct i2c_adapter *adap)
 	} while ((!temp) && (timeout++ < MAX_TIMEOUT));
 
 	if (timeout > MAX_TIMEOUT) {
-		dev_dbg(&adap->dev, "SMBus Timeout!\n");
+		i2c_dbg(adap, "SMBus Timeout!\n");
 		if (smbus->can_abort)
 			nforce2_abort(adap);
 		return -ETIMEDOUT;
 	}
 	if (!(temp & NVIDIA_SMB_STS_DONE) || (temp & NVIDIA_SMB_STS_STATUS)) {
-		dev_dbg(&adap->dev, "Transaction failed (0x%02x)!\n", temp);
+		i2c_dbg(adap, "Transaction failed (0x%02x)!\n", temp);
 		return -EIO;
 	}
 	return 0;
@@ -207,7 +207,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 		if (read_write == I2C_SMBUS_WRITE) {
 			len = data->block[0];
 			if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
-				dev_err(&adap->dev,
+				i2c_err(adap,
 					"Transaction failed (requested block size: %d)\n",
 					len);
 				return -EINVAL;
@@ -221,7 +221,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 		break;
 
 	default:
-		dev_err(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_err(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -249,7 +249,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 	case I2C_SMBUS_BLOCK_DATA:
 		len = inb_p(NVIDIA_SMB_BCNT);
 		if ((len <= 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"Transaction failed (received block size: 0x%02x)\n",
 				len);
 			return -EPROTO;

-- 
2.47.3

