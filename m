Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE7A190678
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Apr 2025 20:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971526; cv=none; b=PXd5Jj/cwriFio0XB1QOmwCFTBA9EXonNedFEUgheq6iTijhQQlilf0vekyOXZYPVNwC80CakflYLeKmJl5ClDQn+MUIb3eJKND9DgHzleBW+WHqTwWkL2fv47cjEc+bATp1cQcY6J7X82nnjpN3KzejenxyfFjC6DrEUZrpmC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971526; c=relaxed/simple;
	bh=/QKe2abRQc2yYg8840jEvGySXkfzcfSJKHrjRel0tUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHQIM+eaglI6WYrQy3aYyAIGGHbzsvXNZ2qhp4JwgagXvPnZ5TBZ6hoxeIMu1G7S6vf7wfaX6rA+INFKkbfZ4i8cfPdXEK4n9wuHublXPGuajrGgd5kct1OPWAggS54enrdm69pQZkR4O++mneZuNliLVwi1SNFAWeYZrnin7ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=HfNSf2ia; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HfNSf2ia"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22423adf751so34521985ad.2
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Apr 2025 13:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743971524; x=1744576324; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QKe2abRQc2yYg8840jEvGySXkfzcfSJKHrjRel0tUY=;
        b=HfNSf2iajlc8hviP3f7ph/VB12AbKcB1/wLeHW0IcMXn5shz54spvHkB335qmJuddi
         Kp98s2eZ2mb414BudDdE9IJe9maZaD5asa9UiRPLMW4fhZoX9tSnilA8Xv8hCk6FNlTM
         7nBubvNKC5/IcKVa4QxCU+0y4UA5wltrGXXlMnaPY2Vui1IMXckRWEJ/dvpgkRpJ3ckT
         pMF4IFSMacQWHRAp89xSc4HP+x7Id6jkzhprF1/4cAUkIfUb5R/HY6iC58CT8imR9KwB
         2YhvUojtT5NqQrmJuWlZLfQKq11+cJwPoeStiFsgGeU8I65VPy/Zu0jOUnpsjffQMhdD
         +D1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971524; x=1744576324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QKe2abRQc2yYg8840jEvGySXkfzcfSJKHrjRel0tUY=;
        b=UUqAw+0aK2FVrz/ILy8KhO2lkkT9WbF9BBsUomM4ywVvdGAG8LOkC2E8ZB/XzvFJc7
         88ZAVYgo2sSei42eK5OCsUWst6SuBh5eeCzD2w5Xtjz+ixr1l1wW8ljaGjdqdS5j592F
         qcna5abFhNiyJBlBtUvV0BVUDlF26z4RoJUH031p9V1vEAz2Z7VQzLk2sJm06U5Mozb6
         GPD87NUEjlTBmNEUdNo1KIudisUgqktk/OqSEDXTmPwO3+ZYh+YwGf6BkZwPfd2+qWOV
         YxQM6iDRKbYt7lghIwXHxcqNXjqEjQTwELsmHKGh1NLMt7gpFZ2MmNCkv9se34e6ro9t
         jurg==
X-Forwarded-Encrypted: i=1; AJvYcCUqW+aveJGMF/8xbcAgAI0tGjL3OXYPM2iQhQqs8OhJaezRauWEeWM22PslMz3aWNUs20clUa1HJCFuMA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4LdHejbiVCDmT62nGuK3+y7Pa1NvM4OTHt7hGoUmx9LktEJ/N
	7b9XmxO29kX1dOYhKDM1dNrDkGy9XJvTtjLkx6ZvGv9WJajmaMFWu6u1Wt/Fsiw3Had6n+MjXMP
	1CgYHouCivBTaGoiM/hDuDin5CFA=
X-Gm-Gg: ASbGncveqDmmz0OpejsFIbr4dKeRBfR6XFYxqrfX5Bl80/HsrV42e7qChJvOW+dc1rc
	4dbqEI96KMdDiI7OaS6F1GXokX3RkQrkoiC3VvOUV6KfiZoiUh3uUuD9/ph5o+T3VXBdOactroj
	m8UuD6zfLn4HPK0QCdSVTb48A8AtIC/MuzRty0IjAu
X-Google-Smtp-Source: AGHT+IHT9v90+iSAiZXg5CI9I2oqKoRX4lqsSVS1Jifp+TsFpnk0GJAUF4rHe1Z3iO76l1ihTjaQBPryFYN0akQAcDI=
X-Received: by 2002:a17:902:e546:b0:216:410d:4c53 with SMTP id
 d9443c01a7336-22a8a0a24f1mr155808815ad.41.1743971524234; Sun, 06 Apr 2025
 13:32:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org> <20250404-kconfig-defaults-clk-v1-1-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-1-4d2df5603332@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 6 Apr 2025 22:31:53 +0200
X-Gm-Features: ATxdqUGuzCGyUj4WFxWudQ3GalFFdus2VKUZdP35pUaLUbjhJd9NZclZR-cjauk
Message-ID: <CAFBinCB00HsScB6d4UboQkp8HPQ3pbDwbbwnzwgqJOvHwBDSdA@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: meson: Do not enable by default during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 1:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Enabling the compile test should not cause automatic enabling of all
> drivers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
