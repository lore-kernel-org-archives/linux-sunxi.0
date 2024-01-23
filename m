Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1B78004C
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 17:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706032198; cv=none; b=tut6aMbd4SH5TY7Ck7YRMlR7IhwwsyFkCWAmHdrOhyYcf3UIXyrlPpi9l75gW/XR3+iIky0cZWr9CCIAc6r1TD3irG9bm8xxv26rtP9CwzX66DOV4gHtTZqP5u3dlL8Qe73hJthh5EOiGlGVMoLPACL0xZE9kAv6+j9cEgAW40c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706032198; c=relaxed/simple;
	bh=pZmhTwrYFluya1Y15DJtUQFyoFTSJRRJJCwBZJCZ/7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rl6ISlssXaeIBkjUX5y1HmfJCjqgfQlx71pGS5ThvT9SKej9h1ookmzyEl7a+beXy4USjeRd6vVKb2YKVzgg3IR2u8/tEJfPCkA9DGxEoOYH35XaJf8l8SOdw+AmPT3AlMS67Bq/A2lUfw9npTsOOBZeYALgW5OelLS4uOttk04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLxA7sS2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLxA7sS2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40e800461baso54950835e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 09:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706032195; x=1706636995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phUpc3vqpaERggtFkDbvhq6Ow8Zicp3uWb8jHfud6kw=;
        b=FLxA7sS2encXtVC0E5oEqV5u1vMEKsOFJSBxxIoXL4VYWh/d59KmeLQgDK9jwwPS7W
         6dMNom3VMyDG5yyRODOUpXrIdzSWJCdMgdMjSUogkooqdrUcSjcbWbh8kOCWVhCBEzp2
         VyzKW5+P82fpyGfLo3+03TtHA+wls+BHBN4wXNhBZNwArA/ljCOLRO0envraV3yX3YgW
         xe5OSlgPqlmv7xePrqt0SXbHMojo5v1X34QNjQQtK8Fh5eYfGQkXBUK0HcAEK1s8f56d
         SjDxvKstbxlxcYc7UXPwrRljh5+gKNnXjQnb2Qu4mQok+VUl52bTmrpkEyRo0qFSuX3r
         DPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706032195; x=1706636995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phUpc3vqpaERggtFkDbvhq6Ow8Zicp3uWb8jHfud6kw=;
        b=avIdbecFSv/Xipd7uVvZEk+JqfFBGex/mE9mbxSRBIzkvsjxGZ4Cj4Rh6JlJ6Z+WO2
         JOX8fNy8Kx5Z7shDTs9yNHjgmuHv23YJlEApzROHrXDZrBws+D6DIikuELPgSsV+0mvF
         MnwBOdSCLGRsISE4QAq68mE7jAjxPnCdBkCZTLgjwr47OXBo9LZoMPgztjODf5a0wB6r
         bddzLA3XDXvPgN5oQGa6JgjWcaITV5Ia+vPUTY0wM3m745XKMJJGNBp1rphheZfnzu/S
         wuclZ1YL6gFhdjtn09NGDCFZGjF3+XKzmFo87rEazXlMNMs19B87kZmYO+W0ivOAum+h
         2PQA==
X-Gm-Message-State: AOJu0Yx/XzCoFsFDazqqut5acECxxEaY08fh6J9vDZHijc2HpEaAfrJW
	yLfi8e9Pr5EgZnw7B3tIcDIANbXGl2x0njzpk/A0f6L+tkxgpVUO
X-Google-Smtp-Source: AGHT+IH7zIW6Sody5lpgf0QjQ/UUb5BDBibnCsSPJ9ObnPZSc8pZ+zdBI5rEoa7/i2qPfa4nThePJg==
X-Received: by 2002:a05:600c:198a:b0:40e:4786:9379 with SMTP id t10-20020a05600c198a00b0040e47869379mr416361wmq.103.1706032194674;
        Tue, 23 Jan 2024 09:49:54 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d5711000000b00339273d0626sm9662579wrv.84.2024.01.23.09.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:49:54 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-sound@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/7] dt-bindings: sound: sun4i-spdif: Add Allwinner H616
 compatible
Date: Tue, 23 Jan 2024 18:49:53 +0100
Message-ID: <8325591.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20240122170518.3090814-3-wens@kernel.org>
References:
 <20240122170518.3090814-1-wens@kernel.org>
 <20240122170518.3090814-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 22. januar 2024 ob 18:05:13 CET je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The SPDIF hardware block found in the H616 SoC has the same layout as
> the one found in the H6 SoC, except that it is missing the receiver
> side.
> 
> Add a new compatible string for it.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


