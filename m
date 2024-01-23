Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770538003F
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 17:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706031733; cv=none; b=o3ZbbY/0O4J3oP2BiBPfgNcQdUO3KlgaM3RPwHVX+8Jj+o3M5kpDPGx0j5NUrygklWnyI4S8HbkwTul/mrA/fXKflogcRj8Xv0aI5Pm3jJS+E7XcnLTLhnVDB5i66qLMIN1L8kO522Ki/PCvG03vCoAUgRc0VpXQh/YDgEmA4iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706031733; c=relaxed/simple;
	bh=eax/EtDLlyAHvmuizexdFChDdC8AlZ8nFb8XRqzXxHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fwrIi7ZdZ0pMTV5lZxnPcqPx9owm+GfIn6S7x9e6yMqmY3y0b2XtlgClq6bOHJM0tPFRIobVjMD8Un5OcaPU9vm6AIcHrbixEqnoz0yWUVSvRYdjn6MEeLY6RrfLbeHzVUhyI9J7V1tGgGDLFSQyw+tZifGJIZZEwCJaUiEhcUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHRJEuvz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHRJEuvz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40eacb4bfa0so26010185e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 09:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706031729; x=1706636529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eax/EtDLlyAHvmuizexdFChDdC8AlZ8nFb8XRqzXxHs=;
        b=aHRJEuvz0S6ruH2uM7N1nxm50YsPJXhM0hI2+oyN0HIXEiNKp+GU4rjw1a8cvAUrTC
         pUFR7gYC5v6MGfuD1KrFNv4bw2vX1K0JO1v3vdCPuxXHPTzGpZdohCUc0drLpDt4CxKq
         yChgPZsci/ZQVKxFmgSFwrw7OnhNh0zsms//4Y1eiGYYS7T0tLR/jM30QLjyx7dU7w/7
         bTq6AojvNYM1yH2wjK5ddPO4NSPiWzGLdhuizmYITAhw7Y726/MlhkQc/Y2zdFSldWje
         LUeSnOc7EFSphXMZtHp01S4Ii4zTzq77Sb1Fl+Wj+5nNa5qNq/xNxgoChGaXtIGgiJno
         cZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706031729; x=1706636529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eax/EtDLlyAHvmuizexdFChDdC8AlZ8nFb8XRqzXxHs=;
        b=BN8rNrK+pD0KNjWUsmKZ+62tJufm8NKWaeQOo56i6jTFoxflhipTY2oqVjU+24T1Nu
         BqRLYiSQqlx2mIhzxOgfzY/WjIy6ykT6cYWNcZ3dosimPXIHKIGToHAoEa7UaWT2qXUq
         HdcnoX1+F7I6GxgqeNtLdJYZ5dDm11/1Ye6Et7dt3J1V/gLY2Ok2qtC7Fq7ATXyL8G0Q
         caaRU7MfZKyT+V/+MKyks/bS3LnDejealTRDYexQjsCF3T0E3SF+ObPc1+FnNFQmaNS0
         gZWS96RDgCzdrXH/KlJ/FHhZ5+HXIo370otkBcQumSKcct2SceFwXMM3ykg8oLIfN+f8
         +5pg==
X-Gm-Message-State: AOJu0YzCgcWw5yd45jeR5Aetl4srXGOTdEMO/TWU2X8mLxP7Z+bZZw4y
	z8mYbZr1gHAwHAQcv3zqOXN8+nP9s77NFcXcu9QNm/B1Qwzvsr2vKaWsEFnV
X-Google-Smtp-Source: AGHT+IEHI4pj/K4LiqnxQDGK5V6KRCyGVOa0sFel7fFOcCnONd7ha8avu5EPQBpiJt5XmNPfzI6IJQ==
X-Received: by 2002:a05:600c:1e23:b0:40e:758a:96d5 with SMTP id ay35-20020a05600c1e2300b0040e758a96d5mr339369wmb.167.1706031728897;
        Tue, 23 Jan 2024 09:42:08 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id az8-20020a05600c600800b0040ebf626bfcsm2267320wmb.1.2024.01.23.09.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:42:08 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clk: sunxi: a20-gmac: fix kernel-doc warnings
Date: Tue, 23 Jan 2024 18:42:07 +0100
Message-ID: <12366031.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20240121051837.17564-1-rdunlap@infradead.org>
References: <20240121051837.17564-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne nedelja, 21. januar 2024 ob 06:18:35 CET je Randy Dunlap napisal(a):
> Move the function kernel-doc comment to be immediately before the
> function implementation, then add a function parameter description
> to prevent kernel-doc warnings:
>=20
> clk-a20-gmac.c:43: warning: expecting prototype for sun7i_a20_gmac_clk_se=
tup(). Prototype was for SUN7I_A20_GMAC_GPIT() instead
> clk-a20-gmac.c:53: warning: Function parameter or struct member 'node' no=
t described in 'sun7i_a20_gmac_clk_setup'
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


