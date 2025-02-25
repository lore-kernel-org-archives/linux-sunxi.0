Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF18518DB2F
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 21:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740520299; cv=none; b=k3o4ecikhWybQsJllZISQG3F0aqgncUOnHhsSbfTGAnhnGkuH4X813oyWTqHiDrE9J0H+97F0I2Dx7/ukwdRYMeI2zsUjDEpJ3++tGbxYvCBhTMQL3bLg5jQlZrIhLvK/Rk/0Z+O31BlreH7TgXKVsoxOqnzDLy++AvYSzlXASM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740520299; c=relaxed/simple;
	bh=zUHi0AJJJCLJAhCclTuxVVO4dK4Q4dVPyAyoh9UCuUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfkRilHMq2lygDsvMcY+3V0cgb3ECmnfHIjhtcvoUEWS8LDt9GSEzW0Ycm43FEPq2uUJ2H6MWpE/yY4JRCD4VYG8qjYICP2sp7lmfh3yE5jYMoxbfwzWOGKlOT5RwKKQ+fgvk1P2PNf9oZ6UJ2vMCLt6J7Zn/equXVsx0GwA/Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRcFx+14; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRcFx+14"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22185cddbffso4098205ad.1
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 13:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740520296; x=1741125096; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=h7px0Ndhq9lUrgjQFROlw953RzIYIbSKavntnqGmD0o=;
        b=YRcFx+14ynXxqRZnRxEYJf+dmmt0gzGvDXfaFm7b7xS9Ja+eTsdw+UizyHwFaCgTDq
         mHR81ByE7z61pzKvabASq5igRS1MP4cW2HootRcY8C0Z+4E1uWNhbqtqRmZA1BRkt40p
         qMyRoMR7Wx7B3JgLSC2Td/xOTvrkuqk4iy5+iIpa2Vcg+CDr6eGpJ1rgoll4oPSxsxjR
         xYLy0UxNFpSgq4Xkbb2FMFh7xU+Frt8Pff+tv0L+gAQmDpY8oFnWLxENuXNEwAK7WU2i
         vwdg9qZf0wIrsBK7HqGqDOwFIW945SyZx9a4tcO2Vix6Qj5JWpshPHH+aj5h98vg/ayN
         anNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740520296; x=1741125096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7px0Ndhq9lUrgjQFROlw953RzIYIbSKavntnqGmD0o=;
        b=e2Ti4fkXcPFy7KC3a+io8PfIhCUvnUVBul6p1c6B/2OJgpZbKzem83abR43VCL10wa
         fis4Vza/BcASxc9MP2qChHJEwPW4S9sn0PhlhwqUVtyy6XR4k7rQNkr0ZueNeF75SRAC
         uwtHpTWmcUPowEp5N8BY3Rb+4c7dI+2MXCbNj4uU0BjvxCOE2J18PYDW+d+FnfccGte2
         MdRKN3hGzrSx9S58Wzh6HblVb4Ab19MS9bD1Rdd7cTOOtJueZS7wPppJB1j8+aLrsH0C
         XrFsDaAGm4QElRlsn8ihW5pJttUiGnAEwzwHUlNopS4GFWHv5ka1i/e/JQoWg52LvlWW
         PVeA==
X-Forwarded-Encrypted: i=1; AJvYcCWuukvB2KXTj6O9/biMeyDcjm2rvD2KdCY13hyyE1f12jQLnHNCT3fYzMCKgy7HmzTTkFirFj2mOAUa0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbbA6+mVBy3v8a78am0fKt39f7dgQ/dFo9PBj0n7uV1huq5468
	s80Q0nTjXB9MK25CLmvkiqvGii2Atir+GYZrA5KTcaQ+q6GuPZvW
X-Gm-Gg: ASbGncusTYN2hRrCAWI5TK1chihaexqvw6y1Q3WhMUlz8/OiChoHAEKleqS/g66tvjP
	ab7PvX+pRFfDLG2dHH/QtRtD5OQ10CKKxL41gaVFs1jw4DEFI/4J3pD7RGqpWCNmeeoJNNwk5im
	fIpI4GUBoncG/jbcMEvIZReYzWA2ZMSm+pkZR47Jg0aYb2OyyZlsewUg4HGDQt/0p0GK4mmCCg5
	XMRncDqkhs11rayi19Bmf6hl1yS/oETqWbHoD2x1lIHOsX+fRl9xThU558tesQh+cp6UPeVPpT1
	e9i3+UiFBc+0mmoKI6ksVOvp/NAT8Y9+EwKuSooDQDbO6ZN8Urf2HgGb9JNjDfEdbBMxG/tKXtA
	=
X-Google-Smtp-Source: AGHT+IFDUxCf16vlokyauZ7By83P4bZv10+rmxrvEgQvW7LhaUGLdE7Sqg2syC9gOosegx4KhIy6Dg==
X-Received: by 2002:a05:6a21:150b:b0:1ee:c8a4:c329 with SMTP id adf61e73a8af0-1eee2c8c34cmr36492575637.0.1740520295994;
        Tue, 25 Feb 2025 13:51:35 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aeda75a0bb7sm1883945a12.12.2025.02.25.13.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 13:51:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2547277e-d9c0-4138-abaa-7afbff1ba3ca@roeck-us.net>
Date: Tue, 25 Feb 2025 13:51:32 -0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] watchdog: sunxi_wdt: Allow watchdog to remain enabled
 after probe
To: Regis Dargent <regis.dargent@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250225143638.1989755-1-regis.dargent@gmail.com>
 <20250225143638.1989755-2-regis.dargent@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250225143638.1989755-2-regis.dargent@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/25 06:36, Regis Dargent wrote:
> If the watchdog is already running during probe, let it run on, read its
> configured timeout, and set its status so that it is correctly handled by the
> kernel.
> 
> Signed-off-by: Regis Dargent <regis.dargent@gmail.com>
> 
> --
> 
> Changelog v1..v2:
> - add sunxi_wdt_read_timeout function
> - add signed-off-by tag
> 
> Changelog v2..v3:
> - WDIOF_SETTIMEOUT was set twice, and other code cleanup
> ---
>   drivers/watchdog/sunxi_wdt.c | 45 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
> index b85354a99582..d509dbcb77ce 100644
> --- a/drivers/watchdog/sunxi_wdt.c
> +++ b/drivers/watchdog/sunxi_wdt.c
> @@ -140,6 +140,7 @@ static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
>   		timeout++;
>   
>   	sunxi_wdt->wdt_dev.timeout = timeout;
> +	sunxi_wdt->wdt_dev.max_hw_heartbeat_ms = 0;
>   
>   	reg = readl(wdt_base + regs->wdt_mode);
>   	reg &= ~(WDT_TIMEOUT_MASK << regs->wdt_timeout_shift);
> @@ -152,6 +153,32 @@ static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
>   	return 0;
>   }
>   
> +static int sunxi_wdt_read_timeout(struct watchdog_device *wdt_dev)
> +{
> +	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
> +	void __iomem *wdt_base = sunxi_wdt->wdt_base;
> +	const struct sunxi_wdt_reg *regs = sunxi_wdt->wdt_regs;
> +	int i;
> +	u32 reg;
> +
> +	reg = readl(wdt_base + regs->wdt_mode);
> +	reg >>= regs->wdt_timeout_shift;
> +	reg &= WDT_TIMEOUT_MASK;
> +
> +	/* Start at 0 which actually means 0.5s */
> +	for (i = 0; (i < WDT_MAX_TIMEOUT) && (wdt_timeout_map[i] != reg); i++)

Unnecessary (). On top of that, its complexity is unnecessary.
The timeout in seconds, except for reg == 0, is wdt_timeout_map[reg],
with values of 0x0c..0x0f undefined. Worse, the above code can access
beyond the size of wdt_timeout_map[] if reg >= 0x0c.

> +		;
> +	if (i == 0) {
> +		wdt_dev->timeout = 1;
> +		wdt_dev->max_hw_heartbeat_ms = 500;

This is an unacceptable API abuse. max_hw_heartbeat_ms, if set,
should be 16000, not 500. You could set the timeout to 1 second instead.

Guenter

