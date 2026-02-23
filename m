Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD3D34EF15
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837221; cv=none; b=fNnROxHLQjQ9+EpfWHL2cLaCDclLtlkrO0F/Fry6Tne83cacYev+I6d44Mj5g8+Y3MircuyyrMn9bEBSdlFuabls5vck40iyKS5FUyaNncdo4Qk0+0ddFwMbvjAvUS2E/ugS+TXlDX9BEO38mQoDkx1rHg6b7CbPTJC6jYC+TCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837221; c=relaxed/simple;
	bh=+nrztrv3eun2Q963Kt+vOIIxHNHM2moiogYKDHo0wls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nAQmKN5hHlv3Kksxr/FCw3kJDmq+jGDZn7Y/D2LAUHnpaWvtNp3cN1503p8PE+jTP5htlx29peFvlqOR9IkBgDN3DXItbSVv4RoYlFboWCVV6dexstf4hKSyeEbN80OSSJ/sbafEX/+Bww+oMt5rAZZBbIL8G/Yy4wVJBCc0CIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TT0IGx/P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fmhp/6Dc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TT0IGx/P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fmhp/6Dc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N0KPXY2169796
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=; b=TT0IGx/PYUI1U7Ol
	kdWhf4gjUtimZksuqySAj9PKyiTbtTW1gVg4VkaQbbvu9xGcv5SIHNqkRkMHepfV
	g7twqGAQFobRdgsd/cXNgsHNgJ/YA4LMf2SF37z32lOEexmghS6ezEygxKPmyKYE
	o1sTZMCkUOkGo5df+14DsjSRzobWFnYlsht+rmhLzKoq6i2wMQ15klzZYcVMrAwv
	p0PuF9056UXiFL0Rbj2/JtKRmJGxsc/VS6PNggCqAb00Xs1LizbuKFdja0LTtSl0
	adfUiqxpOgTLQbwuOEuohEAlh/zIbFumspXaXWFeqmMNO6tKwnqQDWHqZfj+9wNQ
	woHLVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav2eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb5359e9d3so4201291685a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 01:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837217; x=1772442017; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=Fmhp/6Dc6NFdrukEoOAVMAeJ1NlPmowSJZ+keRiM5EkPmtaS9UvQf/RY5JgWV88t3D
         eJZxkSUxcd2jl4YXRrTNQ/9LIu14BSvppha/ZGzjQlY33wg2cTV3J7MwTf8vNkS+QFJk
         vFVXfJHu9QHmuAWh8G/PQjqfoflgx96OiyXb4wSXREe0Plhc0qDOH+4I6Go+xmJy7up0
         mhdxc/vdoWJLiaLd22K7UXcanaDVPYMVwd48oHZ8yRZvDPg/Sr8ZwN7q/nAhsBZ7/Kjb
         wPVahttzRDROOIzIV5kpWhQpzeE4yIWxsGr9K5x2PvM2/GpNu8KluMVzXbiv1J4hfocT
         Fwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837217; x=1772442017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=tsnG7HRAdJqSAuPn+CI+HAtrMXK+Jnmar7M1Qq+4SiAIuUbnAiHl4Y+BNIW4FznhHk
         spsC4gMIlfAPwEWrjpzNR84PQRMsFU/I+ZNZkjsAEiCZa4MXiycs/K/c/YN+7mhwOS03
         7P+/pRqgkA7N452Jqi8EJBFgeCrVKCEjf93dLJFQdVZi7p44xLqWZ2kjZaybDQV15Ba2
         v48Povo+CIUzNwhD5fhsoAPfrMOoAX9WpswxsMghNLjwMUk7mtFm2Yz2BJRqVdPcL2Aw
         rk4j5B+sc8Do52ih6eGAEAjQMy73zAgIhCnJePCvcpm0xPwbIQaM46oKvO4EVWjTDJci
         v5Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWE6ZHa1hwxLgNscB0fpx97ABAecZgTBaEOmAeYtWTZ7Ei2pkiWto4c+DepYA+QhGixETzILCo3TJXiLw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6wRCnr9/3X0FKiO2JNDOe+iIV0+1V1c7stNjvuKA+SJ9a3obu
	g8EFFTMoP0SPP6tOFyDjMj2B9aL+KDHlTcNW/Yz0oXVX77VQeu/5pFdFb6vWpQsxfg8NzGdgE2S
	IbeF4DqO0QIE9pkaMQoySTK6Z4rj517+cV97ASsZSLL/JsllIJ+JUPv3dOAkzorg7Ew==
X-Gm-Gg: AZuq6aLeUVyPLgGp+poxnaTZOnTEUqZs+qxehGqdFXoxs7uM2xDZxqovpHFZ8p4O02K
	DIuaEB1k3rZkTQliSZipowRgln2iVDZFwVLj1dhLIHD47LluFNn8Q9jYVQjui5S8Ls/fu7P7Bib
	CYnbTsSrQX2yaSr7yYwQ1t4gA+Kuw8uyZf8QHlUBC37OWPOQgS8MCWJBR1V1g5GbeQe7Sl5DwTD
	dPAcAmJG/T8Uz4K/fTPsWOWJ4u6tkSOOchg40r5ISBa0Y2eicop6+trsvMFJN9Stbf1Cmyt2oxL
	bn66yFI4VXFf7QvKFpwLFr05Ht99fAA7ss66+5dfQFqOF+CZMWDF9CN6tBQYR3KBezQE+c8cLED
	GRrDZkfdljEFeAe2t7761w2dWLAs6qjZyzKgErT2MnUeuGQd3ayD7
X-Received: by 2002:a05:620a:29d1:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cb8ca6e5f5mr946105185a.38.1771837217148;
        Mon, 23 Feb 2026 01:00:17 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cb8ca6e5f5mr946099485a.38.1771837216730;
        Mon, 23 Feb 2026 01:00:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:39 +0100
Subject: [PATCH v2 10/13] i2c: owl: use i2c_adapter-specific printk helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-10-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+nrztrv3eun2Q963Kt+vOIIxHNHM2moiogYKDHo0wls=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcG0op/5Rmmcmy1LClzr9Cd5rvHSa2IOhyh+
 IHRW3jceAiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBgAKCRAFnS7L/zaE
 w5oqEACL8mqyvJjis6Rfx0rOWs5khRMic3wAg6GrTXJNenvQou1AWcDbjBunSF26We1tgWQEmf7
 VRCVaQ/cWoy6LateYwLbZVzpk4XNFkbere/m43SlqDPwo5mWGAF7HmASiol/gc4AnJ6gGEic0Zk
 47TiKxSQ7+nj4p9k2Gjf1BALtw9qKgtTXgZIQkG2Mipxi1fV6I3KnMXvY9LLcSdSanBeW6wgYBF
 EN5KAfr8gi0sGkley7vLr0vlCaL9fJUw3wvnoxaGcjKZPIqbjPJAAbio28UP7cwtt1fv7nTw4qo
 MtkuZG76tz6CpvoLwK7i8qoNFOZMHmqKXVY5VwTVHUa6adviUk/UXcsECWHknfSL1o/F28QPipQ
 TOxHFbOj9KmIGFJ1/G6YiO54Z13GwZRCEBBXi+KYgh9e6Dg3XJ965Z589WrWaJO2Si1wCWxNTZK
 cBuTsMAuNvrbrkcZ8vFSM96OHqLs18szgWhcgb3nuLqXqd5YdBfpms2I6hsaz9DXxqnTGXoZSBM
 1vNqLs2epqXyzG6VlfibW6cEzyb+80lDvbacE7/aVxEjQjMS8k5LTMSKMIue8o/ZvU1Qs2Q0kmW
 eBqKRa5zfF7/AswvNJrigg31veDBrNwzhG/+0B6u8EH6op2DaYyv/l55F29zOnJkV5kC9vi8FKe
 EXKVEvxa6w8ktEQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c1722 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=td_-LIo_6SHiI0BopBAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX7TNYG2U8LIGR
 gUEvPBJ2b6U45dUTj58zjX5hJVO9l3ORB0jwjbuRzPo/GGZ5EqveTeNmldweZqMiBsQAVO13af4
 lehp5bXDU1UieUjELAC+40dT/lISORTBXE8CxIbFqfsk5NdApOmbVxsAfisWNf5PD3vcS8iqRUh
 +mU2QSCd3pFfLFTcuYfLa1SE18ekvlqCMJqMt/WIdGQ2LdO9PKYpeKUQCwE49StbTK201YvHNML
 KcZNfoWOji4URYS/rNoKkKbVi+Fl92bmsFu4VAr+F0whQOG/fl6AU0rpvRAYhNFpey/UviB7j4i
 mnhU9ojphAKry9mcA3mQ805a1/0ogg81A3uVlloTLOWVg9iWhMfAj/uQbWtTyqlZ4H9cJA+UFp3
 dR50Lv3qN3gUErx3AqqI9/+3WVYzhGIV2mGF5/BHSZdzA5PS6XyjgXWblNybMoXbGPZQoGBIIX5
 XL4pIrx+TSY3Pzj2Oug==
X-Proofpoint-ORIG-GUID: xXh4NawsslxJSQ2M1-ZSaaaIwWRhu19j
X-Proofpoint-GUID: xXh4NawsslxJSQ2M1-ZSaaaIwWRhu19j
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

