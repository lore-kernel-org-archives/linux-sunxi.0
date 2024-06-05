Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6796C14B97F
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 13:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717594717; cv=none; b=X9+ExfnnJI9MgogIoQjafycN9/nryV8CReojYNioTsVKjq7qjt2xMzc4LtQe8gGxj+3MMYiDnDMb6n1Fb/b7g47Da0I9cdOHyQqJyHae0UU1bBRpSuuEpHGsOyXeB0Sk2usYD5EtJfCgJuWS6f+ogTmJeTZK80N+mTgbAD/WBr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717594717; c=relaxed/simple;
	bh=mlhApMpG5WU395YtWwS9QPBflIL0rJC4v8OyN6FnRbc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJsm/qWECToxuJYZo5zxFoCiLjzuPShIkZcCJxsSNikLFhK7143qvuGvg9SAk/mz5b2HErVTU/5fgwYpLhqrDlHnwqfR3B3XKEPtuUfTbKs/VSTuubNy4Jj1HHx5Fmyya/fVywIspkemGwgI5M3Oy7gpg1ESiGeDb6Jgs6NS6Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WoH/3Bxv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WoH/3Bxv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-421396e3918so48144465e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 06:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717594714; x=1718199514; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mlhApMpG5WU395YtWwS9QPBflIL0rJC4v8OyN6FnRbc=;
        b=WoH/3Bxv090D2dAU38Isxa71lU6Pu31OUhAd58JHBlbCXwFK0f2Lxyn3ojIhHLOSJq
         52q4Li305POrBOpVF+xq0/PIfXP451Rt2r2cwzTnWGDy1WZZY/p1KFpBfrIPvGdy+ECa
         0AFbZUotJE0wclFxhWexGB01A0iKxfXqJo/B4xSI/UcuSTSHXwMWlum/a3t/0oWm3VoD
         F9eNasUKz2fcZxe/Q2LxV+2vEZhlwIKZ7rcV5iVxWlREAjwCROU4Hr7mF1z7yTVOL0Xk
         +mKYVX1h+vKHq/IRcv8pWTOn7s2Elk2/Fe+O/b9tX21zxVInSYKhi53k1Q8fR9ohOR4u
         kOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717594714; x=1718199514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlhApMpG5WU395YtWwS9QPBflIL0rJC4v8OyN6FnRbc=;
        b=fDkKubxKi9UwjiEuvg0iUJmRxhB14BPyoxoHWc8aBwFy17x64EGq5kk0Yuz5EusQux
         vR4uoYFrf6pG9+kd6XVhPtQrbmHsdzqvMmtuwT7fsRKOgF+CHGjbZPbln6cGvzzYArsh
         OjwfS3fgYahw3rW49W0hOc9RNCLZntEwTdS+px+1Woaycdvenxy5ZKbLtKb0gnzVEFwq
         1mEeq/sNcdiD5JgZGdZbawHvkqpKmMlgyIRCZ7Gu91dPtNu1uzkT8ucFp8+XEnS36uHN
         PWwWplMsuU9FOf4Vk0FbFr8gKS0JErH4+98hf3iJwbVQpXROE7zQVygQTsG/Kirb8jJR
         KCew==
X-Forwarded-Encrypted: i=1; AJvYcCX0mspg4E54lobaZHnXUzneNQnrwa7qbIwNKJEoKyiSLsWkodTG23MM50inafiXtJsyZPBtOrF2AuU6kku/kSRlI6Jsnl3Q+mr7PVM=
X-Gm-Message-State: AOJu0Yzk64pVx4mdSOpCq1T14vJ1JObzMFsQDBgBLNk/qCyYRr2ybvWZ
	W7bTzSe7WtrK3M/OmVop0z/Vx80Q8RxbmqfamKg9Whxfp0go5UIrBm7eG+DxwZM=
X-Google-Smtp-Source: AGHT+IHjkretuS1fTFtZei6hChIG2kgCEQtxhJThqCOKkNHqb6TBqHMder8dhApLzt0DEjaMW0SbBQ==
X-Received: by 2002:a05:600c:46cd:b0:421:1fb1:fe00 with SMTP id 5b1f17b1804b1-421562d4a37mr26359565e9.17.1717594713675;
        Wed, 05 Jun 2024 06:38:33 -0700 (PDT)
Received: from localhost (p200300f65f283b00ca876ee5dd3d1e3b.dip0.t-ipconnect.de. [2003:f6:5f28:3b00:ca87:6ee5:dd3d:1e3b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215814fc11sm22296825e9.48.2024.06.05.06.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 06:38:33 -0700 (PDT)
From: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@baylibre.com>
X-Google-Original-From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Date: Wed, 5 Jun 2024 15:38:31 +0200
To: Hironori KIKUCHI <kikuchan98@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Aleksandr Shubin <privatesub2@gmail.com>, Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/5] Add support for Allwinner H616 PWM
Message-ID: <d5mr73yc7l6w6uvgqb4ymyc5267do4zirnnorkpi5s6qa5vckk@owayit4mexk2>
References: <20240531141152.327592-1-kikuchan98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531141152.327592-1-kikuchan98@gmail.com>

On Fri, May 31, 2024 at 11:11:32PM +0900, Hironori KIKUCHI wrote:
> Add support for the Allwinner H616 PWM, building on top of Aleksandr's
> Allwinner D1 PWM driver v9.

It would be great if you could arrange with Aleksandr to maybe put your
efforts into a single series. I think this would simplify reviewing and
overall handling of your series to me.

Your first patch should for sure be squashed into Aleksandr's patch #2.

Best regards
Uwe
