Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D1031E858
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Jun 2026 22:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857301; cv=none; b=oI/4tbRb6vQJzqKd0Ni13NU4ibUsSSqPUSY33Q+ZRE1rKvKSxP6eIY3SPPSZ7WyML10hSZL6wPGAC7FvalrTNvKfGTyFV1LWQYNTk/f/8acokMAuMfuNiI6dle0GyOkkb4NdXxOpxQybGqumvMTsDQnGu16TrhiV0PwXbQM74Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857301; c=relaxed/simple;
	bh=XWXB5lkBc/phatIESF5YzvRqacHTijEtNRuYnvo2MIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfhJso+2nCjRXUZJcV89rMsv35BCneUSJ3bJidv8VcNAB2GXnttcaUp4IVfzpMA9Sj8wPNGzv3R9oQH62FUrN8vPx22JK3gZyMalb/seEP2X8YvTFrYn1D/JN1I429YavA5WrhKvyaB5x9aZg/XF2CSbOGDcMPn6CX2FrV3Nh2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCTN+vD4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E65hIRx+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCTN+vD4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E65hIRx+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDd8c2920080
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Jun 2026 22:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BcCIhz6+fnrglONp8q+fp9mef6PmcObbxRhKXStO7Qc=; b=cCTN+vD4HZwmI8lY
	ejqu7lzDeKTXwqFAMS/sTRNpvdMoMiAxUyoiJA4eFhpTgRLfRvMGXkbNO/sLcOq/
	Kr+o5qtLY8bZPydk48LmdD/QYhha9Mb3Zu6Jg+jFbz2OOi1lt4JlAnzouxfKRufJ
	1vGYuxgbkXfYsDebztJs91VxnfPK2OfyBaisU1JmguWpqdxoLPcaXic72syA9QUH
	lQgzTeaDRLIA5CkABN64XzCZrZhXKelOBhJ4L0wGngzhGDLoUE7KBunhksmwlV73
	6OwRuUZRp541lZkHdVRtlTvsEu9R7y1qiVobl6Ek9AO7twcGrKJzrgt8SbClgnEU
	dlxizg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvw8v3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Jun 2026 22:08:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e55f0613cso421149985a.3
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Jun 2026 15:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857298; x=1783462098; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BcCIhz6+fnrglONp8q+fp9mef6PmcObbxRhKXStO7Qc=;
        b=E65hIRx+r6tFFxvRd8GviK6lZY4DRtkYnou607yYJIRV87Oyjh1mXKZO+h2DUM+x3Y
         Hmn/Dy2JbTdMRKVQyGgv0S7cQQoGTltuqKVorJMN9Spwn4A9suoXdlhzRjoKjaIUIlkm
         a4uFv4Dv2YCVQnYxQzbrOofYARE2yqndIv+r4RRg9O87WRmQ6x5TPOMjgcrmC81BglGv
         sx4axWzxyA//RuNkTxQW78A4ekCUc5YhpxHCdH+xB3qzC7YE2tFVFXUskQ/+I9GvXvgq
         Jn+GGX5CRG1fZeDXRJjGhD85sbM/CDirs+ri7gCbBsSh3P7mLbQRV3fssFm+9lDtcCHg
         mHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857298; x=1783462098;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcCIhz6+fnrglONp8q+fp9mef6PmcObbxRhKXStO7Qc=;
        b=XJETX/R59VbYvePxYbhz2v2kiCFNtMY6CmZGGy2vdAUQxhZZjdWHHQtAiNuOnTxYnX
         nC5yfLtYiw2jDorwnxMlYD9RzivGSe2O5mE1utrkmjPM1DJAMUhD1sNtdL32zmd2CVEu
         PrmTJvdLIfbP5QUG9BNCPFBE9FsCXefcWV+AbSpxz5xFesQJlKd1ACUQ/hu57vOEqdmT
         1QrRZEa97WFbY0Fu4b4CQ0tfh1Nx/ceas/WJ6dPbESIq87U6ojoSsxOYAH7IYIPTWBFg
         rMiWXG4bNA5FdbwvlSLzIvAu/rdqKQvz6siYuR1T+n6/Qt8imIMGK+ydzdQCYGSZHcZ8
         MOgA==
X-Forwarded-Encrypted: i=1; AFNElJ+VZ5/YvAcjnWsUPlMZGeRort1csps3DYw0xfnpaEaqSVS3YWL8tRHudqRKYeKZ7PWqVckBBMSeIshEgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcX8idYntlEfzQZrmwEb8OfBhpcGR38mng8ATJpX1w1gEOVL8s
	qXrhMDKpRfboocTiQQE8SUQ7eywqSdC4FIas9YbHyutYFo1G19w5IoG1jbxULiDxfgODlj1f1rv
	eYZGeLAzSu0XoDQJYDombSGJB5gjQiMaTNgG8AkwtO0ToeM9kwvnoApQExRL4yl7Pyg==
X-Gm-Gg: AfdE7ckXD1m8yeCVCKTvFmSDGmyoxZNzu4GNLLFGK65WC4h+HbESKuJ3qlLor++rLOx
	ISMBnsjbfv1Kk5xTFmAcuyTPbhqVLO7MMLCmLuXUSL5BZa/9WLMaAeLOyHWhXEJ/K7MvOFUvPs/
	8fLvnuQ/q1mjh3T7zl4hlOrPh8lyBaYDTFw0O2leyWXgML7x7TL3RsIAH5u9bRsakXmZIieztPx
	zTzJz/hcC0pXJp0hfikPtFYYOkOYfFc65prmfI9tfaSXKXjRziSi/0vrQXjjR8GJmoMPBSntoQ2
	ym3gvUoSPQ+1kFnw/yOA0VjKRAltFu8txS8CjW62gu1gWlDXfsItwTKMZB8zlGIkChIYrQFqAid
	vp7n4L3W3yJdFTglqKZWtw6FV4Wh2TaapEsYdEsTv+eWMt4XlugeeYy37lLHR3w==
X-Received: by 2002:a05:620a:25d3:b0:92e:5c56:727a with SMTP id af79cd13be357-92e627fa3f0mr909679485a.60.1782857297833;
        Tue, 30 Jun 2026 15:08:17 -0700 (PDT)
X-Received: by 2002:a05:620a:25d3:b0:92e:5c56:727a with SMTP id af79cd13be357-92e627fa3f0mr909671285a.60.1782857297248;
        Tue, 30 Jun 2026 15:08:17 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm9903482f8f.19.2026.06.30.15.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:08:16 -0700 (PDT)
Message-ID: <9c94a0b6-a2e6-4d3e-872d-b1d3954a4071@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:08:14 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] mips: replace linux/gpio.h inclusions
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
 <20260629132633.1300009-4-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wUsjw3SPaP52qfY_r1rYk1EE5NI3ys2a
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfXx153162RrIfL
 j0aWLrqAgL4nKHjvVnD69lo/O5xCePSIeHZsX4cp3K5ssJVo9bCmz7DI/sNfOED8diwWpLHCZGT
 ITuU1N5l7bnU4jaCVCXGqoYwMmxP2xk=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a443e52 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: wUsjw3SPaP52qfY_r1rYk1EE5NI3ys2a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX/bP4wnqowMgv
 LqhLn9L5fBFvvX1SxGvJXMfDQ/Zw6G2LvnP6qmzrsonTIslmJwPHXATGm/hmPCx9X+U87dl9sbw
 yY4emNeuqd1XuBsXoplHBjrpp67wRFQNx7fi8Lw7HlgQZM6qXbDjKC7TUWiTLiC3dzQbXqd+/ra
 a7N+aeUuy25tM3H7Hh+dANYpVqySaijlynOt4ZPzxx49AXSsLjhVDZObgRZJ6LBvmdeVHQVV7pZ
 pOH0vdutPLNjWCgeYDky0RQFrWn0QJimLJup+OEHrY2yEA5Esv274oikmtfKE4n3Azl1Fz+Rz5X
 3E5tOjiB7lyQfam7wDJJ+BMjQk+fXgYgiSrh3PwOWkfCvyof14MijRB1FrrmmlOYEKZPFQ8lrCY
 K9xi3oBN3LzcrUxV97DmH5T2LZBzu/zrrR/aKp7um/UhF/rv8IS/1LOTSFL6kFWEYlhX/6029Ey
 nSjklsMnB1Et1Qgebzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300216

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h should no longer be used, convert these instead to
> either linux/gpio/consumer.h or linux/gpio/legacy.h as needed.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/mips/alchemy/board-xxs1500.c                   | 2 +-
>   arch/mips/alchemy/devboards/db1000.c                | 2 +-
>   arch/mips/alchemy/devboards/db1200.c                | 2 +-
>   arch/mips/alchemy/devboards/db1550.c                | 2 +-
>   arch/mips/bcm47xx/workarounds.c                     | 2 +-
>   arch/mips/bcm63xx/boards/board_bcm963xx.c           | 1 +
>   arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h | 2 +-
>   arch/mips/txx9/rbtx4927/setup.c                     | 2 +-
>   8 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
