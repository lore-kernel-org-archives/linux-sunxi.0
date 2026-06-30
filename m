Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A11E32AADE
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Jun 2026 22:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857400; cv=none; b=DeSrSsEXJZEkmdQQvnlowKUUGYYFluw8CcvJM1HQuRSan1HEopSd9BIelr3jsheVvXye3LFDNJqbudGMcPvE9dMpWN8uKUsB8ecyFap7oEekInpP/BehhwB01+2GAuBqvnBC240BX4u9PjC2xdRx5WruUl+3oIvpvjKsNnnVzKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857400; c=relaxed/simple;
	bh=lka07Gr3l2JawsdDoDkCfszFn1o8HA7+GaDRSGzKdLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PZoZy9oPGWW9w7Vn+N7w/codJB1cT65gKc/2Yi+DooGsqBEeWg1sYqS9TRggfAQoNwnP19ztDEpzEkuK8T9HgAFYs40mxUz/yRyuEvmnmdC2Caftej5JzeR6SXlrHSw7AS28+E7r8+wFRUTOHnCJto7NdhGIGF3mb0EPH+yXfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVVUyqEg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+8yhrbD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVVUyqEg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D+8yhrbD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDqIj2838628
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Jun 2026 22:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=; b=UVVUyqEgI3aai44H
	QkYs6h4Sk/6/uPO94ctKOtJjj3n5+wTduu75T3lBINHDzCPeXdCe/LLgdz4BiIIA
	I6FCYJGuW6rbqCzG+PqGMHpMb6xjJcmfkHJt1PYgP/kntODh+X0VaaTTgDbDdP/t
	5mK6QuZEI5QJqRhPc//Uvx2PsEtojBE3Wf5jUoCGbxwxji82ZKuqfAGOBqi/CtJM
	MHsN9S66aTzRxKSc9r6r3jxLGT72P0S66dSuzw/gjfRycE/zeF8d/az8b9/+BxqX
	uSr2XsXere5zlNsaYwMjPVwz06xYAC/u+oMsdfeWvyWqnAZBEcPGno6XGT0scTZD
	4sRW/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd1g4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Jun 2026 22:09:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6a2f5995so251311185a.3
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Jun 2026 15:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857397; x=1783462197; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=D+8yhrbDE3tIqodpttB/cVrzDJFAil03urP1VYHdgKE1gDWBYsPxxudOtOi3ERpMku
         4HeGcso7BX+kRUK9wncff7Q8TVuQdFbo1KAJX+D+c7XnoZw2HFKXdoFzI7jOcAC5W82d
         UcDX0goHrsnJqslbED/QU+FBj5uspCfarwztsGu/pVGW0x4QuQw8TblaaRWs8Cd0/qob
         9t8WhvzbXGfdk5oGK/GYa0L3hd/QXYUl8Onwjd75SEl2Cc/HvUHt3MZvL8XEaExlTzYE
         E3Q5Yw9tG8TljQykFHeW5AR433iT5ZF9lFA5/aYMwG3RW/LqcP6m2sectaDLtYmJkutm
         xeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857397; x=1783462197;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=EQzX9R7SG7AC6aiWfw4h5a/ldzOZbokqKUtQ9zJONpDVSvQ3psgIp0tozNNVqhFDQX
         HIEHySefiSwhl1ikptMUmn0cQgs0nFHSlAOUtWtwQh9Cm4X4h55jK+0d0ga87rXwsAVe
         EX32z1V29jCvF5hSnuOMteY7rdZq+p4rCVgHUm3tuNb1IMJxST5Z9x1e6ghdP9ivtdFA
         usDrguH1YpJNpUkCbwk/TpXqXmsBBOBxOeBZuNOIp96vlSJ1pVsQo5K9HFxULuLfhneq
         pWuXtY1jdbOC/c4CfgaL7JTh66Xb06uUc/RKkeDc29SFu0sa5tXY5yapnOPUjQw4tCpu
         ETNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Q/dk0PfqMyjekYhCg4QgQND2pUBOnDf3424jR9FBokoN1jtdPRHH/P8WYjCCWbhRJHxR1kjZGgAjRJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywuln2QvsPQ7GBCTHCJO6ZEJj2qHs+2mDx4uGXopeMX1ftSz7S/
	brwl7pp+u1QmfL+M4XsDmYEWyYfQEkbHYX8xCjMsCqOeg1ac1HmUYQ0ewLPOIBb9MKy4rEivt5E
	Z9Q60F62fYJNulrt30lt1eHPPK5o9tYBLVyIIzgA670sOAzpU9JNHOfbwzWlwaynaRw==
X-Gm-Gg: AfdE7ckH83oUrrW1/pfnQ7CRAl0z24AL+hhLSYJeIqLCqvPrFFeyryTXLWCUgZx6m0f
	tqPrMTk6iP5+6a+gv6/sBx9tl1kBeZEGCuPrUUF324nSn9CCgLnWA+LbL5s6xkcmcXRcwMyZ3BA
	yKX/EdDi7Tr6wMbSew4LKOqM+tOjuOL6b2Cj1jFtZ3lL9nW/Z+9dbsRwLn/ku5On3ShYujLatwa
	lKKYPjITBG6uCeHExMX1x8I8GOF7g3qcbOQWhztRXWkdNT5gFdAYvwE5buX6yQXYnXYBN5xPjsO
	OeoHg248JDKXdH8hJm/h3u6Hz2yYdwDRu/NIAuxplFHz9TFJfqPf7My0aogC1NdiiaLOijoPAif
	9YCwp3OEIzP3zI9y1yb7YUBQyl12FOuX0q33GviP5QF9b8yupdQ36E70rFlK+bg==
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434242585a.66.1782857397395;
        Tue, 30 Jun 2026 15:09:57 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434238085a.66.1782857396955;
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195b3sm11865243f8f.8.2026.06.30.15.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Message-ID: <caa30078-9dd0-4f07-a206-2dcbd2ba09a1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:09:54 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] gpiolib: remove linux/gpio.h
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org
References: <20260629132633.1300009-1-arnd@kernel.org>
 <20260629132633.1300009-14-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-14-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfXzOUgsxp2K9Bo
 3rIuaNFYu0m2q0sbjpIsBmUkeU7iG3HvpTKFJ/CHpXlb8IJygw5WL8auMPhl8+1Zp8w7ty1rltA
 9UCkTd0dwfjl5NoHtKVzS0ZnXATPyAM=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a443eb6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: eaRgEcJdMXcxO65aYo5XrNnd7QQKgk7o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX0o16PbOgcRej
 wWW17ZIrA2xHkVesAhlRQpFxW6456ZVjodMqsqy4W7y3kvpSSGoEAy1DPIfYOEzO8t8R5lfBe8j
 WwWMbTAHauJ/MIT4mSnW2Zx7dBeuqzjJ0Q6RI0xgPO1xpdc3WrVNXPHcy4xMoePbuTqrAFWKfR3
 BLkBX1K5rgzKxlAILDo/Ig3ba/yMn79/GWsr1/wfTrrenjsXoARy5gokoebPsLELYUNxb7Pyxq3
 ChZWnTn5GUMrWF+cIjJsgXegkcWgJiwXaYNzBD2KBVQqpt1pIEP7a9Rv8W1VXqsJXzIkR/vWp7m
 zKFp5phV7cmgIsk2Qt4DPRJwp84aztmh+ZUo0Rlt/xaOKNAXzRCxoaIwOn6T5V0FYKBrTHcaSNU
 E6oTh4FqeUIkRMwsDTB/LSIY6X1sAt110anqqAkiGSjjXvWKiRJaK07P6+gPouzs1hcrO1O9Uvz
 s/fCurMWPGtpqrcIuGw==
X-Proofpoint-GUID: eaRgEcJdMXcxO65aYo5XrNnd7QQKgk7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300216

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After all other drivers have converted to linux/gpio/consumer.h
> or linux/gpio/legacy.h, remove the final leftover bits here.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   MAINTAINERS                   |  1 -
>   drivers/gpio/TODO             |  4 +---
>   drivers/gpio/gpiolib-cdev.c   |  2 +-
>   drivers/gpio/gpiolib-legacy.c |  3 +--
>   drivers/gpio/gpiolib.c        |  2 +-
>   include/linux/gpio.h          | 22 ----------------------
>   6 files changed, 4 insertions(+), 30 deletions(-)
>   delete mode 100644 include/linux/gpio.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
