Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159FF358368
	for <linux-sunxi@lists.linux.dev>; Sat, 11 Jul 2026 07:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755268; cv=none; b=BDUFxFUHbRPrsJ9pPLeD+gFCGIhGZ3Z6E1eccoqjTGtcptYzcoWyKfadujUkimQj3w8PZZ+wu56Qe6XabG4SbI4vY5tJMpM97sa4wmBfGDopXyC6XZ48I1XkJbEaAP9NGOx+JNTbuLmF7yScxFr4seKmtQhoVFEkUkznm065rGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755268; c=relaxed/simple;
	bh=gUnPJvqa+6hCH/9HCtTO8STc6X6BWHZ70c5H6AKWsOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tYrLNKk/T4z785UMJLC/Idu5DHXo/5GlML9FO3vW7bbL0wjY3/k0M/ucM2Q/JhVkF15nIwcHvHQSbDzBOJbLgJChitjXILJ5X+JBJWNkB+rVTZz+AdRho7jLtwa12EUuUGMGqI4vDaYA22sXEyFWuQffgV9trJ0KzvsLenrSCtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1IEh49+; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1IEh49+"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb6d00883so1567784e87.1
        for <linux-sunxi@lists.linux.dev>; Sat, 11 Jul 2026 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783755265; x=1784360065; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBafLctpeA1AoyzErbEa9EGgxzwRbfKFWoPKc6c7bv4=;
        b=E1IEh49+ZBw5tczQbgNCdyZeoCwabOYKInRZmshTg1EAjiYE08ti9nuex/6L6e1PSL
         5dOkH7luX+pGJbS8CWevOrzzxZfZOsnbaOdFI1YnozkV7J6B70kiLdUrtBMi0FSMMb91
         ESfLpRX0e8mcnZCB6s/CmZDO6ZdT6kz2CXWjkkpvTj9c+iu4RwGMDAF6QE3u136cMcnu
         CFjAS9beXkwK+Mu5u5fhM5TfgCoDR+3QDBqUAzOkysnnTK5IiCA5cqVDXMdWhKGeXKFj
         JxdEsel0LA90JMCx4TAVztWnu2++V0DoxY5VOgC47R9rihrlBCq9kn2YR3rOs87Hf0cP
         PsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783755265; x=1784360065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBafLctpeA1AoyzErbEa9EGgxzwRbfKFWoPKc6c7bv4=;
        b=by0NZZ/vr101pCDaZqmtznQmBUp7xQ5J69lGs/GNHPhO5QhfsqRZ9Bwkgo4ywPurnQ
         h27CULyNAM1DkzNs9v6I2mcsID8OdliYAtVKiQVUETQCOXChng9gDVsSdrnHCJUEJIAr
         JZhQsYD4b6Io0X2h82pHdf45m/a+71qa1IHGSSySV5nnreXWIQ9o2xfmfpVBKrRPeSr+
         VxLHkVfJUmhl+UZo86q33t66zhzpi4+dQlFEkzxdlAn9Iy3snFk/2qlcDP08e1sR8p45
         Uhg41Vf8eOpQ0WsIAvOHsR8ugLPtvi0d2jh7R+0OyeCLAMag9c8cy38bLTxzN8oNswhz
         7iOg==
X-Forwarded-Encrypted: i=1; AHgh+RoR4NcmvK4EXhcL39Kq8etQ9u6B8KtgbcIOdjKiuiNxNHBjQyHgZ/RtA5pzqbnPjmhMZHFEynriaiaYwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxggQLS0aiIsFvRxI0OOmdT5eZDcAzz1puiBTVaRnBVqqrcqvp
	Bv+bzaewG7ICmHsrZRjQabc5yDWV+VtPPWCGD1/5dfeQUL9UHmdGsxwl
X-Gm-Gg: AfdE7cnjpwybf1+Z7M3infIwtPXt4q33vij5z/tQMQ99wGj4b34NiR0wx+hpj1PulzP
	e7GCYyXMc7uSjBmpmicZOMwgp/szDiaRdr1HFH5LAeL1oAk3tFsBtRGCbknwX8TG4rcWnvJpSp+
	0b47+q3jmklnmYCMcKc5o1G1hH2f2TdtHIavHgj+QVsqLG0g25KW1/gD5A/TEZ9ftp/oGdtX6dl
	xIG2eHnA1OeOcO1g+wVIfDNU7UsxwLmCBn55gGKc+EWbCIUvI8Q560XEF9ptT7PKCvApEx2dFCg
	fY8BXW3qgRPnHMPwgTsEHybEBJHxq51yl5JDldnJEN19v1dVD4rVPdLVa9Ty1amZrx+8y7kJ29h
	QdvZ9EXvpaLLL6bfY8cbNtyS8/oyJ0eYC8Nz1iUEpWmpgO07ugFze6+rNFdLYoxuhD6cEnpVdG8
	C+QgvXlH8TIFX6juooD/2v6Xbl+jf6/3x5j4+DOS8xoIJbcjtCDowb/fGJ6ENmMp77HD4QLg==
X-Received: by 2002:a05:6512:3f8:b0:5ae:bf45:e3be with SMTP id 2adb3069b0e04-5b0236689cdmr321070e87.21.1783755264967;
        Sat, 11 Jul 2026 00:34:24 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:4322:18e2:4e2b:60a6:4ce2:33fb? ([2a00:1fa0:4322:18e2:4e2b:60a6:4ce2:33fb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9dd41sm1117527e87.48.2026.07.11.00.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 00:34:23 -0700 (PDT)
Message-ID: <de1d491e-159e-41c2-b145-4d09db091031@gmail.com>
Date: Sat, 11 Jul 2026 10:34:19 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] ASoC: replace linux/gpio.h inclusions
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260710211954.1373336-1-arnd@kernel.org>
 <20260710211954.1373336-7-arnd@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260710211954.1373336-7-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/11/26 12:19 AM, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h is going away,s o use linux/gpio/consumer.h instead.

   s/s o/ so/?

> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>[...]

MBR, Sergey

