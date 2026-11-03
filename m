Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712868;
	b=MA0nXNzlekCmNl2ZU1Plso10rlCx4SuqnUcwZTc5WwY/JyIxPsIrbywatLQPVR3fifL1
	 wau1mwcXgX9IvJ6F1jRAKHOXBcQwUshcXTrb3Bjui631/KKUg6PagOZ5FG491uLzrcRnX
	 mZoKU63hli5gvW4e87N5PlxQZZZTXzHNU+rBbJZvdzOWcYFlmJTeEGbWTSbVdygcNF+F6
	 H2GZOhkFkyG/DVGL97VCR4yECRzf73EbpFX903cwtbULLTSzK9is4IQgxDIGI+gle6UKz
	 ZdZmTZzODFysKmp37Hix1Ahr6v0JRI1A0f4NGXDum1ylmvdnvz5DtUz1+/Ezgwg0gsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=;
	b=jRRdp8lGpE+dacOWWJE1ht2FtCZSXbNfBIajDqLZtu3ixabT8hCll5mfZEpBBTtHSyNy
	 yayCrP8brBHcUEKaSiwOc0snwlTdqyCK7MQnTmFBwkeRShEPYktzTjetUMJzrnvpQRzEX
	 BL0rVDssX2aaqbwDgEMHQvw+8+TnkhsFn75/fN0RMve6W+i3FyQ2nfDoHqopOfr/nqYQR
	 2tYlHnfR58+HcQ/+sc+5YY7fVjJ9Cz3kChzbKCKLU+996HJO1UVhH4SRVC+TzwDplLlys
	 AxRRdHhV9fhT4EJKwqdWcBJeB4MkdhriY+nkbd9Y1lu1NXhTPGaPJf4Rjz3PNnHdUpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PaX60grQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KThbQvr0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC16E606EEBF
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 13:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC16E606EEBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PaX60grQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KThbQvr0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Cl7hg1271679
	for <linux-sunxi@lists.linux.dev>; Tue, 3 Nov 2026 13:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=; b=PaX60grQy2eNFep0
	DO3/PPj54urDEBHx1h8NEYiDFY57Lq8fD8MmHEsFlTANYufLvVHkzSUTCk4EScwK
	Tku3i4Z9MMln/T2hs8xTmb/LZ6w5rpWZ1TRqdwGY0Z74mvFXntUURJaQ44jQs3dY
	52Ymhjr2KHdreS87YmrR+bxRFhXEca1Jy/yVd2FolB/o6mc0s2K07nRXLImQZGN6
	Mt6xSUdmj66I2ALx4D+zOIvSPYbn7h04f+qNfDhfjlCh3Xnv54fPrW04CYHtYKPc
	3+Kyzp6RbKix2u5uwG7hxj8L9iq4BfR8Avf1GjKafw76pJcANkM/PnxBdHqnIEz/
	7xxHNg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ekxgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:34:20 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eaad995a7eso975746e0c.3
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 05:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712860; x=1794317660; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=;
        b=KThbQvr0XDZyKVgZICiionSUHcn7IbtMD70V3PDPI0CwlDihqxnfKZMM2h8bNE2hAV
         CyQfbbA8PwB4pl987GFs5nUL0KY9uHpnz9eg8IH4swGxu0B6UxRMsyWmBMia6yUOyBpY
         pOZnNtDqu42V/EPyKuW82b7P4cC7HdtZoDO2CNKrRzCmroAhxDCVg7LEBHcqdoV8WLFZ
         +y7MYIEeMR48q7dADvKK33Jx/70CGgQbBdZGGmo0Ixa5JdtdizBkjI24sSFfnp+YtCQr
         28LWiUJPHaP0etE25bpjxlur5XsRQpX47p4QBcSAqddYTZ74/PL65H0mgtkEA47NRRAR
         e2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712860; x=1794317660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=;
        b=gNuYcCDn8yCPbbPwT5iFlEhSMCMjXAwz/jUh35/47mL2I79SGr+PZQ0f6agPCWG96K
         Wml15dPh22Q/Y/wgBRsGypL0G0EpisdBvn/TXSi6picYAVzoDnUTxbRvXJ0xdaFPlayL
         20UA2gBaqdGGjxtdhdlBtMOwmyV1IDb4BbypFBzFzl5GG4FwlKm6dXEmeEQGDck4Tl9z
         Ec1TsYYBOWlo1DihE65SQ1T3F0OI+pdANhQcRm/EdWJLidsnbkezaJ5t62/iCq5S2MFk
         dbfv9RSjohOfQORvzJKY+Eh/3u6/st69f93xrxrmSZlzl4/zq02fT6TCyIH9v/tS+FTW
         CUqA==
X-Forwarded-Encrypted: i=1; AKwUvBw49r+/QSvsX63mC5nbtK/v6GeIYxJfhrWoXU2TWxDOCgJH/59PcQzJUmX8wwzg71hdh39TIxaLWRIGog==@lists.linux.dev
X-Gm-Message-State: APuU4Z+GH0+3AQzXbc2Qw5JGtpGCQglcEjBhAEXdZjpIGuJenUzP7k1/
	ZoHzIZFO9titjw3zvCgeP+ULLzfKDqGlht1ezKXAR6OnXRBh617seC9iTxU5VLYEP247e4wa4mr
	K37pNYoPPOOPEA8wAnVONtmVliK70smDVDKyC4sQ1iBogwJelx6LHGdk3to3y3+S7aw==
X-Gm-Gg: AYBFou1iHX0ngmHuNsaXAlCKlwa3GYgqEORN8ED1ZS76gCM7sfSYcekGwsfLJiDpZIQ
	po09a7f7IeMZ5+viNqtAiprw1Hm5L4scA7CWpWklwELWBfuArovktIWVJ5RWd+GWayhLMCMBJIS
	FQhXUQ/fjBhrYvvBjTiP+9lNUMu/Hr2lGRLdS9vVMS6gL/6Sd4wuNK8y2ULAuHNbDCaK/FyTLkd
	csNSz+LwPdtkzj9UzTP+Cf7acKAh4P8vgEeCF35N9h6Ncglr4xbhhTgvYMGJ3CqQ5nY32ilgpju
	3YWXgDQYJF9kv6+5iEPe8Moqztg6yV+nfJ06m/B1kCrxPqab0ZS2lXP3IbgGcPE2+QEcUCpJP9s
	6I29gUEAl7gygh1MyrOqiozvA1Ey4Y8zO96HJ6FNaZm6emvybFs5E4P+uddonzrY3adE28TSOGX
	xziA==
X-Received: by 2002:a05:6102:604b:b0:7cc:9d46:ac88 with SMTP id ada2fe7eead31-7d072626935mr3533206137.18.1793712859581;
        Tue, 03 Nov 2026 05:34:19 -0800 (PST)
X-Received: by 2002:a05:6102:604b:b0:7cc:9d46:ac88 with SMTP id ada2fe7eead31-7d072626935mr3533187137.18.1793712858980;
        Tue, 03 Nov 2026 05:34:18 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:33:54 +0100
Subject: [PATCH 3/3] drm/panel-mipi-dbi: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-3-aa862c1d71e3@oss.qualcomm.com>
References: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
In-Reply-To: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
To: Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=L77EVNO37nJ8bqShHP/VkH28Qj8EpKeHm6Kw3WFdyMI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLSAKCGRs/5xWd0LbuvTkv0Yz4BLBG2Wt+fx
 WEuk0Rn70OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0gAKCRAFnS7L/zaE
 w1m7D/oDxRKdjJGFSMRo90SmI08LhWyVliSQHqb9JufJtsRCV3NGcX4zCS+jMU4grEWv0lfuXu4
 6+4yVk6EQyvgJWHhRyWISjQbGRLHjMgBMZ9BZ/aJdVT74Y+OyN1fNWO6Tjwt3hll/O4txb57Cx6
 DOxKARd/3QmK0BGXUEdHAafVAddJBW9ERKPc3rzCjHVamct6gAoJlElxXM1KRmyTGBsYjXQ0Y4Y
 OE40frmKz80lBd7jlFF3Xp2+pS4uL76NuhhpcIQTOYcvixff+ItacRK1syYVL40xIG+SD3FBlh7
 z7t3xJ8ES0U0guj5vwRBpJa2xOFdKe7z4zHQAA7rFtwA0vmgKpPaK+KzlVi7mNLZwStySmisjC0
 wfhKFNv4uuTiaza96qK6pzeg6UC41Ejwfn8y1DbtNuHYebdPLTUQKHNvve5FNAJLr0xkcNErbr5
 ubhpZ9hiOtBdsG2AEXM0C0sryKXmynqccTydaaYRrtaY9xABHDk288XLpglrFrF6Hoe3zBbBrZr
 eLkqDB8W/ZgRR9exnAXnfgO+aURE3oqvdFz4blA8o/dMao86USkCnoxUVDxGxz8EH9Jrlj8CN3H
 zaSMeQ7LI1ZT3IvnNKhc5Pt84Wnc1aYPXV8DqAn4hNaP/e/4fBE7HyaWGDRDPE6KYvHBq29oNHX
 sE7DR92bWXgVLvg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfXytA+Kdb9Kfa4
 P4FzR6uTqgYuOJrflyKaLKbRYBDDXHDOCsnza9bgxd5OEtdMmMLNzEt9JbDjz4DNlMh+1vJSJgM
 uJJJosICHfrXmTdiGu8s97RjIDdm2FxYaJUXEMeVevNeap8KiY+A1NsJU3XpMAH663gkEvYVHGN
 W3dXKohCV4GrVlwXc2IwzuTetXYACzvsYDLoI+eltJM2iTYI1V0BqLC/Isi6cODl1O8wSpM6yTm
 MbKZEwmfrAXAToxKtZbWLucbl8VwzLAEHDH0yrcFBLm13+XdrPLkol8ZFyBoVPq0SGpPZVki0h1
 rN9ZaOxWOVJKq07W5WLrQ79svTWo8f7gh1uyJ4cq3Hs7WR4o2XA7KTPyJIPnLranHR7wIvHMVjX
 izkwbWKv9Q4DXqZmUnMfKzkvpTg3J9JobK3QJj3JLGDZyxqumls4R1hXI6Vh8LFeqONAY9Vg1uF
 g5cmQAglkfdJtpKOupg==
X-Proofpoint-ORIG-GUID: qBauEoyMMGzBk9n5ZeF2qP9gwvgStJfP
X-Proofpoint-GUID: qBauEoyMMGzBk9n5ZeF2qP9gwvgStJfP
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9e2dc cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Mb4fkPDSjR1CXLPVujoA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfXxpT/PBnbFlk6
 PnYqWSdXwNqk6nB/Z1RGqZejpurGQyDv96zviJA/Hw3PE4RrnT21x1C05IC3BlLECqBir0Fe2A5
 ipkoAjgeGYgL1iWQiDaWy8EV3htivZU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053

GPIOD_FLAGS_BIT_NONEXCLUSIVE is deprecated and will be removed. The
preferred way of sharing of GPIO pins is relying on the GPIO shared
proxy provided by GPIOLIB. There are only two users of this driver in
upstream DT sources and both now select HAVE_SHARED_GPIOS so we can
safely drop the non-exclusive acquisition of dc-gpios.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 60cd65cae41d8d4f4f6e5fbc57d5d34058ca4d38..6f09b723cd7c352b0a1ea9f11a2e58052978cf0d 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -418,8 +418,7 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
 	if (IS_ERR(dbi->reset))
 		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
 
-	/* Multiple panels can share the "dc" GPIO, but only if they are on the same SPI bus! */
-	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
 	if (IS_ERR(dc))
 		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get GPIO 'dc'\n");
 

-- 
2.47.3

