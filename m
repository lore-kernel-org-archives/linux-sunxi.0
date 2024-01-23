Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A145E811E6
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 17:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706031775; cv=none; b=jBl2+40BOTM6Da+dshZTCyYv9OIwV2WddlT3ArAEq5m8JNHt1M05E/pwn/E9VoSghjoF8eVM/BNLmI9aXFNjwBlLiiE6BFbqCQV86u5Rb/+r4AFq+4sOkNjO5Yp5XWbTaf9lWDXY6F1xGONGpRCJt0GAB1Ih8yqUc9mHSnVmWIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706031775; c=relaxed/simple;
	bh=8pc24spgmXPatNy46icvObRxrkz2BjHey8vExIG5+DY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XHjehepuKz+RT5XKWocwTL5n/lPZwZVRMbO4+Ctx9eyl4rnVXJPFRfbz5jYaSlaJmLVAGbrXL8Eo47A4CoZrESUD7lmulETmPmADBzTLMVg1q2pS53ATp9voNw0c08ziPR7sl1+Nhz5DfXCFWD+2R97JAAtsI7srlJFQw+NSxMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xnm0kxGq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xnm0kxGq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40eb95bd2c6so12374115e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 09:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706031772; x=1706636572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pc24spgmXPatNy46icvObRxrkz2BjHey8vExIG5+DY=;
        b=Xnm0kxGqs0/YJOlNl1yqHIyIuTulm9R3NXXM6xnAMZEHprcoIhxCHTOgWHDuMOJCbj
         hjRX7CiDqcCJKNIRk3gWf0Hqj+B6tbdEf/q1h+XlyeVwblFiILEErGAUxY5fZaEqn44v
         4jqcVElHd88oACccISu5YgKejZqug/GdhqSz+Zw4OK+P8NaqAx49RvPy4rb4mfFfGlSb
         aGZzuwoJHdemyxmGwLfQ74aoRCTPgGol3TeJsfWNxYPejtO+wTy4IN7t+dR2lbSWqQdq
         HwBxS/7qRAjOur2KkheFZwqYMVRY06FkX8CJVLIBqCCFjONfiTbxJHMHEefZgTdQwDuQ
         EgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706031772; x=1706636572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pc24spgmXPatNy46icvObRxrkz2BjHey8vExIG5+DY=;
        b=WbynisKI2GrEO1EiW3q5nWDkS/19/kdBX5qG2zfq3nI4E6FIDJwivlibRtYqpxyhCV
         JoloJb5jLoTvldHyE3Ha/CMlwJBtuAmP59GQiuvWBKzbg53vGYmHlHOfPNcbqDn72lWi
         c3tDKQMezpOVxSWxoKUieC7bUYwROzA/w9m1EhBoHpzPrRS5F+SpvSCn5ha7hoy6AB1c
         CwAdzGEGylAh75u7h/3hD+90i5L67srdV8uucfWpKBB3iaI2lKH/+KWtTEwpEPghHnBN
         jCKbHEFWFNFCwZYG/WnVw3uusgDN1uYQjbPtOYz9O5TU75/SCpOvb6hu6/RXCdWKU1BP
         ur9A==
X-Gm-Message-State: AOJu0YySCavS2QmXP46BqpCe1SGZH2VyJ5vtjUb41pVY0ogyaK0WK6i9
	pWotMiIo0e2lGcqeAsKh44lpu/x8V6qdpHhsL/p4vvtK4UxkvN35
X-Google-Smtp-Source: AGHT+IFw87D3LFYgYwwCGd82u9LdTEv5cKIfV943QiE9irMJ589vP9IBdgh8NaBgMnNCK2JgkWgEvg==
X-Received: by 2002:a7b:c307:0:b0:40e:c180:89fc with SMTP id k7-20020a7bc307000000b0040ec18089fcmr365493wmj.87.1706031771854;
        Tue, 23 Jan 2024 09:42:51 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id m22-20020a05600c4f5600b0040ebf603a89sm2249826wmq.11.2024.01.23.09.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:42:51 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clk: sunxi: sun9i-cpus: fix kernel-doc warnings
Date: Tue, 23 Jan 2024 18:42:50 +0100
Message-ID: <4891826.31r3eYUQgx@jernej-laptop>
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


