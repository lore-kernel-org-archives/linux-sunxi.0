Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08AB1474A0
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 14:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740234854; cv=none; b=rKUQFlbXk7oR4FWetzrDyNArUVP0NaCkS9txiUMB541g5jvKtmFxdWt7ttsp6yShXXFUDleMQZfPDtMiNaV8ISFKXOGWnUEvNI8SPrPA5pDdbNa4rFuh8F656GiAe4BuZ9KT/JBRl0L+g3MN3CD7D+yiF3S5zduuw+i1k5iIqR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740234854; c=relaxed/simple;
	bh=kWckQQyPJwAsGQ6UHNDjhJ+mCgwsxq0GmGXdSQG4qQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPS/kOXmBCCVvT4hMPSkgOyF5Kz7lADiqFzdUvrPGlF9uvnu4pfZTXQ+slEDWaq18vzSV5WO2w8nfOlHeocCbWySxP5KeBxJwryL/Gtlxdcr8O4YSgSMHvTQF0O6wmXsBMnhJkHP7IfOCmshgNNt+rWGtGhuC5+0Z9PwZAELasQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9hvNDTY; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9hvNDTY"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-307c13298eeso35170441fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 06:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740234851; x=1740839651; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/vrdSXW1mmp3zS/IFgwJNUwNIOlU9xB5BhTKmjF/3N0=;
        b=Q9hvNDTYjKeeiXn9NzrwF48C+jz/2fKJ43tE8rDzN+4Qddjk14/E5yJ516B++Fvsb5
         nsjBu5AxShJGFaLxC/1h/p9W0sqdB9FU1u50Qv8E2iF0wTfsW8MLaPdfd5z+4qFxMWKZ
         o34xeOWYWeKeh8ZZ8PiHBij8qLv6asLsoceuKDuKUC88DcxFdlg7Nr3VNl/qr5mhQlfW
         q/0K+ztJc+Wz2cfH342BcP7RzKBhLs0lcoBfSBCaErWBshXLkWL+bN4c+ymJby5k5eeM
         naCZxGYzMtdsf7gTyYjy2skhNBc2exoxz8V+f49URB7b4jSe3a3hnmQMNDBWAV1lrffp
         Pa0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740234851; x=1740839651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vrdSXW1mmp3zS/IFgwJNUwNIOlU9xB5BhTKmjF/3N0=;
        b=sHqzuz4UlH72mGQGLkjPYYNAmvi3MdeYn8+2RcN0ZTH7sJ65uUU0/euJ35rQUB64UP
         A6Ch841YRn5wKf5Dm7anvAug/WnIoj208WXnd7GSO/lGJitBxGqlRHsuLfqjUcaly8Fr
         3A04B9CMF7+BJED5xJZYzXJ2/TnZmLeSo4P7LewT6cl4W0WhXUAYsiEJKPXRqfB9qwpR
         EQA1L/UOJ3fSuN0tXxF5NvP1yKvuz6fRjIEH0DBXbhmI6bns73WQD+8xiK2hd1l04rZv
         v/gOTvey9nMnvV8OgwkGmbSXIPkpa2GdsDz1aRrhqsXRTMUroU/VmVKRRp39U5r5mmGJ
         ugPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE9t/TZXQjwnDo2qg5StSPzOWSGsAVHzzf9uFRa2ITZWiR0vK6W2RD3kd3WvjvI7PxB4YMUri3irTtAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaIrsOJIrC+QgZ3Eo4kLLDlTj28/o3wTikTTbm55qsz6N17XMc
	nGk+WgxnHXXpbiwRJNQp19nL9mk3iEsgooxtdGWTWDzQ9+7dvhx5
X-Gm-Gg: ASbGnctOlIhLt/qjjKsBYM3oO3IhOet96VaxPKOCIhGc+IslUYNRpeMSL3tAMA5Zw9+
	LYSC8420lTvDQA0T/Xq0yzLUL5Y1BAgdmFbPTtEny8RV4LVc0KLQDiGzsFrpaehbDY9uBk6mTPV
	Kg06vXfqMdwCeTBcxl4xE313xYcrqzhPbHxG0PT01qvKeihf7uWkle9+u2lYLNV3rl1tdFKUJmX
	5yXSbRChneUPEx1j9n8fvX7On5Yr+up8YPM4eOwhFV5cs1bbQDzXu6o22in9drb6VAl+enDB+Bw
	wz3rNtGNHvsCL/ZhSiDPGHgv81V00lzUuJT02uN71WOm8lv+cHzqb1RmDx4X0Q7evhKUDf/51Mh
	Nh2eOvpI=
X-Google-Smtp-Source: AGHT+IF11dH2rQC2NJCETGFCFh/ZYMG0LizvaxBdfngaTtH1JMigzvLXrgg3UsQOEuocptmLKqGKmQ==
X-Received: by 2002:a2e:994c:0:b0:308:f53a:ed31 with SMTP id 38308e7fff4ca-30a5985a1b0mr25889691fa.3.1740234850519;
        Sat, 22 Feb 2025 06:34:10 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309231bb973sm27149761fa.82.2025.02.22.06.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 06:34:08 -0800 (PST)
Message-ID: <ecfa1b0b-8224-4ae9-ba72-141dfbc12431@gmail.com>
Date: Sat, 22 Feb 2025 16:34:06 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] iio: adc: add helpers for parsing ADC nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1739967040.git.mazziesaccount@gmail.com>
 <6c5b678526e227488592d004c315a967b9809701.1739967040.git.mazziesaccount@gmail.com>
 <Z7ZB7RQhyI5Dohrq@smile.fi.intel.com>
 <b1c1ed68-2f4d-447c-9957-5a1bbc63ef6e@gmail.com>
 <Z7ci7tUlRQqZEZSN@smile.fi.intel.com>
 <ec76334b-bb13-4076-811d-9174170dd677@gmail.com>
 <Z7c2cBQpjoc9-Vyu@smile.fi.intel.com>
 <9018e23c-da28-41b0-b774-1598b946a2a1@gmail.com>
 <Z7dCnRzuQTaJXzmb@smile.fi.intel.com>
 <cb27d8b1-c978-4443-9ad2-96e930701976@gmail.com>
 <Z7isoU9hKXlgsu33@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z7isoU9hKXlgsu33@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/02/2025 18:41, Andy Shevchenko wrote:
> 
> Sure, but it's not only about these helpers, it's about the style in general.
> Spreading unneeded characters in the code seems to me as an attempt to put
> _your_ rules over the subsytem's ones. Whatever, let's Jonathan to judge, we
> will never agree on a keep growing list of things anyway...
> 

Hey, let's look at the bright side - there has been also a number of 
things we have agreed :) Besides, even if I don't agree with every thing 
you bring-up, I do still appreciate your reviews! I do think many of 
your comments have indeed improved the code. We may never agree on every 
point, but I am positive we can _understand_ each others stance. I do 
appreciate hearing your view on things.

Yours,
	-- Matti.
