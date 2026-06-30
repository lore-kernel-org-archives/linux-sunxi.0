Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154A8321F5F
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Jun 2026 22:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857331; cv=none; b=PYPy1n6g+TOKL1KWjUhdO31VNXhzltUubVBT9M5CdwuVN+wCOpz3VrXO+cm2SoKc9K1qHsr1hrSJ3GOBtdPZkjzDcMh4rrJSeLHNYPcto4jWIC9ZVdlHCoSDGQRfCECnBkxozVAN+qWpQgmXlHJ+vDuwLH5D5GnaKLDOSbgh1gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857331; c=relaxed/simple;
	bh=eyMPhz4D72N34DaHLBk8TtAHe/1rzGfpY/U34NdyrfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTjLUdLxJZ/HP2xGcAr2ciOjth86L2UfM2b+3vcdlsqpiwUDseO10I60QOh9/+TfcXHuzDTiVvDq/pYFBYqphQqFUo1sSBeKhF5Qxm7pCNvD6TjmljrPneerH0mGy0qJjdkrAy//mw62ZbmlEYIQNr/Ipum6gkspC0PSQfpPnKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjdrKYpV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=epnYg9d5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjdrKYpV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="epnYg9d5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDj1V2879937
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Jun 2026 22:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=; b=YjdrKYpVqZ8H9XAX
	ibF7vH/kUADBSYjVGZClU63lnyKF8JVv5GZII67PEhUmScSfLZEtlySCd/8RXj6x
	o+rkx6Eto9cTsN3V7OIW3H3NJVDGsBpAi4uBgzMTXdfS8EGc3015nJ1/UL2kEZ4+
	BA9iwT1xYJSu51qvtJlUaI7KWY9mpv+Zf/4q7MA6Zp7fhxha5a52zn6FeCol17DP
	00t0lcWini3dby7PAFSuxWS4FE74H/bGbkax08nYfIc7ANpPU3ABvUKZKfwTZ7uA
	3ZIoFEoYf5v4XPixYIG36bcjUj9HG8lp6iaVzz8ebgdDiRlDt/46JVeyX2EfpF/f
	aeUJpA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hfy9d68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Jun 2026 22:08:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e9489f62bfso320516d6.2
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Jun 2026 15:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857328; x=1783462128; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=;
        b=epnYg9d5LePIIW9Hf4jrrld7KeVwZJiukRZnMl7Z/h0PfR9cIyeMyL036GZQavwNzW
         utEqiYSU6HvM8hOepzhlqdE+VEcIWTCP0hGQ5gnfr3siVlH8SoIktr6K8nAbd3l/0Tzt
         VrB2jPFkS1umFkQaqBnj/fZ4teyJb1uPYFgHnoAKNZL9u0shHht4TZg6WdLMY7sF5b06
         ZJxuojfLoQJsboK/k/ZSngigIbyI9X3jOyFzFGaAh7+oWFJk/v3wbraQAomBt89lZ8xu
         Z+Qk79diCkZWYO37xFME18s5L8gGmw/rQY9HiuwnRQ1lDg0FrbVdahACGZCKzMAauOH+
         kZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857328; x=1783462128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=;
        b=TFKfMQcHIhLiNS0d2p/OxyD2iSxTbxcxlYmjCKrMwRWe31fgg1IfaqPT6Ecn2+uWva
         hvvAUTuPmGUkUi1G0/WmL/okLhtTo5abvilIeC/H9TdYCup1tFpGzLwMyC+y5uGHjyVU
         56lLpPGFblInmB8nruGBmRGhIuOLF8aoevklR8RPWZqrBq1kTaGzymdlHRmY+ylIzu0c
         /S6nwTIUf3XxaL43zoMM9nJDpIvxIo+B7h8F0Vg/fh010+KSL2l8uVgbpQmrwj9Pv/uQ
         oFnzHGl8dfHy/DnDQpiiQD2eVpuXIpDuExib7K48+Q45ByiQNippPntUz53zoJozrckF
         omvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Px1rY8b4S98tGmlW5qt72nOlZc+7CimvNyDDxhZzsslsABlcllDOOiVcWAXtkw67lik58eHQ40QT7Ww==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj46ivqDiqyTHF6Rpy7aG77i+5dVo4Afv7xO4j6gOx+y5h+eim
	9NIyC6/Fohmu3LqQQYqdSZ4dGOF2roYqtukEi1p4sTvvGfD1iaJN57obVefQbvJdL3W+tA3pc/7
	4hapL9tXnedq9ReXJo+hNc3DXLEQtdoblIGDagPr4AAe8U6o/yDOGNlo39JeArmN2jA==
X-Gm-Gg: AfdE7ckRKpKP7goMaXXshZjMZZlRdKkGkpw3gOCHG3NuxTjWbvqzN9xsTAxJVEKBYIw
	GAqcdGirRY5o3UFrt+8TSgTWIFftSbeKxooP7VRHUkS+OvhEVJnskJ4JWOd1sHlxPa9GsoeaAfG
	mZYZhvHoQfrik2EkuRGBQh+0ZauYmNYzDndGpVjIXvLyW3SkFALhf3pZKOxXyjVEreiLKUiQTW6
	gYQRTdN0VzxH3mqM/NDcfzNHN0YpeHm5+tYE3LCU76+RiozTwRQK6XkBlUb2Zt90EefPVrfPGX0
	SBpnzXSx8c5uHk2OJ0iYq6YzpIq4KUFJZ3zJpVgVrNwGG0GTM5AziMMEYAZ7khLAfsW4t/nnE5c
	RlgTpttP6bKz/oX4BaCyyGXHS+S8uNrnxij8kMsHjEf+6kkPv1hOJYY5ynri2yg==
X-Received: by 2002:a05:620a:4511:b0:915:8502:f7fe with SMTP id af79cd13be357-92e6d7dc6cemr404387185a.15.1782857328360;
        Tue, 30 Jun 2026 15:08:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:915:8502:f7fe with SMTP id af79cd13be357-92e6d7dc6cemr404382285a.15.1782857327863;
        Tue, 30 Jun 2026 15:08:47 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d9daasm28380565e9.9.2026.06.30.15.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:08:47 -0700 (PDT)
Message-ID: <6bcfcfca-aee3-42cf-baba-9a926ef26471@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:08:44 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] sh: replace linux/gpio.h inclusions
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
 <20260629132633.1300009-5-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-5-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J5OaKgnS c=1 sm=1 tr=0 ts=6a443e71 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: JMQ__BUNfHVF-C6AyVGtywYIypu34M1J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX7RkDD67yIPWn
 2MDYWAhkFPAQcKH1Io8tV4eaGL1yNLHMpnuILGqD7OUMn5NtaVQiurLSIZwKa3z83G1gAYXrfCj
 O09ljCsboFxd7i9tOeagg7myJljG2x8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX0TO3MdnKc8FO
 vY4PNWaNoXE/Q2Dmhb8CiMe3zNIwBvcDYur6U29z2EfGIXSxQzuu+J5O8HNcOR1mSLSZO6EQiRG
 BbWjN5Te/V3Hb9XlQ40gmpTK9MHn/KJJDMxOnG+6/6oekts58EkbZ92K5czIZspnA7l4KGIFUew
 koHnbeS6CMuRbtQKrcg2Zg1ZSc1osqLg7ojgFIY6bGkfbxcwlb1pqHRREAnP+auFouTP1sdlm5O
 7znJp5ROjF75wC9CT9UkbnXXSyqnlVBe3K9VMbBB7YS9Whw9WA94/T8TNbmXMv6HXTDox5ufHaU
 I/di6ofj08L2jQ2LCBat/hGH0JCFnOeRFr7jN54QQU1EEu8xTjL1QAVcA1wv13MHY5rjH3BfbfA
 LNnmCJse0y5M95VPrOjI8BTAdiLv9MBahUmBqXNaz+xN6lytdPwy2XZQ/kmLZpONg7g9I3HbuwA
 blew/r6Ec6/fB5gSX8w==
X-Proofpoint-GUID: JMQ__BUNfHVF-C6AyVGtywYIypu34M1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300216

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h should no longer be used, convert these instead to
> linux/gpio/legacy.h for the sh boards using the legacy interfaces,
> or remove it where it is not needed at all.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/sh/boards/board-magicpanelr2.c             | 2 +-
>   arch/sh/boards/board-sh7757lcr.c                | 2 +-
>   arch/sh/boards/board-urquell.c                  | 2 +-
>   arch/sh/boards/mach-ap325rxa/setup.c            | 2 +-
>   arch/sh/boards/mach-ecovec24/setup.c            | 2 +-
>   arch/sh/boards/mach-highlander/pinmux-r7785rp.c | 2 +-
>   arch/sh/boards/mach-kfr2r09/lcd_wqvga.c         | 2 +-
>   arch/sh/boards/mach-kfr2r09/setup.c             | 2 +-
>   arch/sh/boards/mach-migor/lcd_qvga.c            | 2 +-
>   arch/sh/boards/mach-migor/setup.c               | 2 +-
>   arch/sh/boards/mach-rsk/devices-rsk7203.c       | 2 +-
>   arch/sh/boards/mach-rsk/devices-rsk7269.c       | 1 -
>   arch/sh/boards/mach-se/7724/setup.c             | 2 +-
>   arch/sh/include/mach-common/mach/magicpanelr2.h | 2 --
>   arch/sh/kernel/cpu/sh4a/setup-shx3.c            | 2 +-
>   15 files changed, 13 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
