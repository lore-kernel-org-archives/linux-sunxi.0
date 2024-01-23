Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECF25392
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 20:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706043477; cv=none; b=K4kzclMaw3GexmvG8Nr4eONJDz25Q/TQ7Rk5iKHoaQDsUT7owAfyUCf8ChI9690Nqlw9FDEMCfXmcbwAHRjfCkshSBrOSB8m2tPWnXk8x00UF7PAu6SIyNpw7MQLrUq400eWuNB9cOyPLcJZBWK7ndeyjEvJxuTWzPnUjSZg8As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706043477; c=relaxed/simple;
	bh=xP7SSkOeXt2InHYZS3rUjVRyG3uFh+Fq8H4ufGwruSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IfmYdCglEg+iJPu9tOcMqqaK3yVQeTDLFkkGGxOvbEQ7gOfwLooi6LNrQfxg7U64daiukMb9qJn5aFLVRmdobBW+paCrnXjtmOlinPKmhwrACpH8or1rMoRT1Oeer8gxSP4WIhzWXiRG1xZbxOEg0AaCj9Q4HIcGAy1dKDA9/2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Im8tvxUJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Im8tvxUJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40eac352733so28661535e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 12:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706043474; x=1706648274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xP7SSkOeXt2InHYZS3rUjVRyG3uFh+Fq8H4ufGwruSs=;
        b=Im8tvxUJjsTQGzmFkw17ILg8842QXGoK2YrKDvRAkdhHDlWqkSjwfQdBl5MC+/3aUj
         bGnkiYgTE24emgH0G6UvHwcvhY8prKlbJqBZOewjAbRUTPKoK0BVo45OcnDZUStbRym+
         Jw1h7zhnZn4SUe66tWT7bS2cGxQVMhERe5DzQtu4LZschQAdqoXIaoUVWr23+CkpjvUj
         Mp4+57H2olFNc6EkKYUZ+ivWd+mHggREEiEi9jIjB92aNjMYS+Lt0MGckfdOJwwYwm/0
         VKZXJYyceXmzzJmtGgJ7WA9KkqzoLj+0PHcIhEqEo9tv+DnZm733jGl7boBt4crZbZ1w
         K/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706043474; x=1706648274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xP7SSkOeXt2InHYZS3rUjVRyG3uFh+Fq8H4ufGwruSs=;
        b=BQrOrGJiG018ZXgjgCwvi5Ek0rtsJerQQ0WcVlFDgfKyj19Nk9sHryRjlAyeA2H7lk
         gdPkD3yYm4+CbVS8BYvcQSuKI24ahEyQH0hVFvpVVl7LYDeN9IdXszn2N8MMqXrYrwIj
         Gg01tg+SH35z/jEa6j64H6Pc4Xp/5Tke4g486xg8HVTc11/jVD7bLlbJsAwut/HDClPx
         muBUKuL2TsSAHkW+2HOtXkt7wITembJlcFx4rUpUzd4H2yZzyMLAnL9DMyovCElhI5Qz
         iljodeaixYcqIVmYJF+Q/d42NfjzhZEgyJBa/+hAUWfopdFucfXKLEVoidqduk+Wngrm
         fPaA==
X-Gm-Message-State: AOJu0YzpBIIwA5dRjBVNPyjizKuu0ht6Qmo5qYju4RcxSj3Zl7J4AMD8
	/zWXWPmLH34ZKHIo9chiN1CX0TQjIq6/T8z4AWOCRACF/eBxhFzc
X-Google-Smtp-Source: AGHT+IHdEtypFxfaQKT1tvU4PciOYbYUXDQ+utYZl1uyqcrFgM34bxgMjY4g9TnF9xKJhQk8C5Ht4w==
X-Received: by 2002:a05:600c:580c:b0:40e:b257:26ff with SMTP id jz12-20020a05600c580c00b0040eb25726ffmr512843wmb.76.1706043473485;
        Tue, 23 Jan 2024 12:57:53 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id d21-20020adfa355000000b003392a486758sm9521904wrb.99.2024.01.23.12.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 12:57:53 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clk: sunxi: sun9i-cpus: fix kernel-doc warnings
Date: Tue, 23 Jan 2024 21:57:52 +0100
Message-ID: <8366441.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <20240121051845.17603-1-rdunlap@infradead.org>
References: <20240121051845.17603-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne nedelja, 21. januar 2024 ob 06:18:44 CET je Randy Dunlap napisal(a):
> Move the function description kernel-doc comment to immediately above
> the function implementation, correct the function name in the comment,
> then add a function parameter description to prevent these kernel-doc
> warnings:
>=20
> drivers/clk/sunxi/clk-sun9i-cpus.c:25: warning: expecting prototype for s=
un9i_a80_cpus_clk_setup(). Prototype was for SUN9I_CPUS_MAX_PARENTS() inste=
ad
> clk-sun9i-cpus.c:184: warning: Function parameter or struct member 'node'=
 not described in 'sun9i_a80_cpus_setup'
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Emilio L=F3pez <emilio@elopez.com.ar>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev

Merged, thanks!

Best regards,
Jernej


