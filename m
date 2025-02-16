Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7343C152196
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Feb 2025 08:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739695185; cv=none; b=HDbtQEYeSa0yVUjm/2+WkPlQ4Rq73ob4KMq8qzbCTsrwFomyekmBX+wqve+c95FW9DdoOIago4m5oWI1qxjOVNZ8evpIk/zsNa6ER4Co6MUUHAUfGkGDzfUapzvuCCxbSFe/M7rZOewkLnV6I+voy4wXZfs7dAR27UhKq96L53k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739695185; c=relaxed/simple;
	bh=4AdpC+R4N8zDGtraiU5Lmy5Fens0u4reg+EHPOLw5QQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+cwFfTOVAUO4oPdmXcY73xC2Jp3Eq44PY92ZZX4ecjeUyObgAoOsmjV11eEVEaWqehoe6kVKtOQEOn0y7zAgEq+MYEyf0cVaQeE8NR86nNcPMTnpUNSpPjALqPVGGAR0VUPqgAMq5QgRG62vvoxmo0DZkg0Wp+J3uCwwNBgv/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30762598511so33640821fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Feb 2025 00:39:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739695180; x=1740299980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4AdpC+R4N8zDGtraiU5Lmy5Fens0u4reg+EHPOLw5QQ=;
        b=jfzoChNUX22r35nx/h10ZSVU5hBx7ci7I+FFd7cqDSKpWNPZ3hxN3GTV5YRBVUZ0Q+
         UvhWtd2mIDAAN+kkuNnUUqJiz6sreOveMPgpnfyszDlxYdMFzzCfeCx+0SBnAgRPZ0FK
         +qSU5nHhNesswpXuvuhviYHIZ1ttQOu4jEGYLhzPbb+/WltEpr64gd3LsTxqHoTJTSBj
         UViFpwOCOXJZcasxRFKMl+jCcglk8U1mGKEN+wFk1wZc5cqlGrOkt9TuLmY3+hcDAiV2
         eZG1M16lMchAIjDjk2rBRxNvj7OfEpeYxbNN76tQxHaSHRhFEHYr1o1QdPJ18ELFdmwq
         vb1g==
X-Forwarded-Encrypted: i=1; AJvYcCXQ46Ivi128PUawZlMnoJ1fOFUY26AsGsAP9P4/UUBjudGeqKOadRhHHYrlmeEjx3vkajwHN2yORwEgZw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yysx3pp0zOoGZV7xqXf0A/kZE9HJfd6vTZi4JGWun9dGQJqiela
	MQCcURl3BPWyIrUHouA1eOHv7Ux+uOB9XFYhrnNPb6BsPUXyGa9faGU3gzfz
X-Gm-Gg: ASbGncvBOdQIJsEXPH181fOMZD20vy9q8vI4V7MW8roescOlYvQE5KSQHVSY3tcoTXh
	tCeIwDqEeZHDtu6DJabtlk3ujviQxAWeV6Wk9KI37QRRIFXPDms2VDvfw/6EPoWV7hNnd+YIRs7
	iiCvNbYqSgvfo7YsUvRl6Tea/wRH/u2AE1AJQqW6WzuQVEKZmk6hpl14ECAs8ZqXF4hruNgw2n9
	0NI12g8N49/OZO6AVOKxGYQXn39A6myVWmFEzmL0zStPCNAx582Cjcr4/ayEnIErWeq1sGXlR7+
	TG36St6TCXDLXsVU6WlE+UsIMkGH0Syd4ukB6ca5safy
X-Google-Smtp-Source: AGHT+IHCurW9S/Mz9+MNvZVk3zY9S0Be/fCHK49WzBUYjwCwRfiZINDqtAxOwLvbwIUm/CJ2FM/fnw==
X-Received: by 2002:a05:6512:ba6:b0:545:2550:7d67 with SMTP id 2adb3069b0e04-5452fe6af3emr1673950e87.36.1739695179531;
        Sun, 16 Feb 2025 00:39:39 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2a668ad9sm1166691fa.10.2025.02.16.00.39.38
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 00:39:38 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5452e6f2999so2082095e87.3
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Feb 2025 00:39:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUj58XvpZR1gKlNR5JZ6HjaNah7vUhBpISGJOfdZokCVjjOqe092O16EUBNvJeZQ4dlCaZz2R+iYnHLWg==@lists.linux.dev
X-Received: by 2002:a05:6512:3b0b:b0:545:c89:2bb4 with SMTP id
 2adb3069b0e04-5452fe3a9a4mr1513881e87.23.1739695178124; Sun, 16 Feb 2025
 00:39:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250214125359.5204-1-andre.przywara@arm.com> <20250214125359.5204-2-andre.przywara@arm.com>
In-Reply-To: <20250214125359.5204-2-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 16 Feb 2025 16:39:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v66q0mymn9a0uy5zyYCOKiLV+WACkM6SHoy057u-F9vstA@mail.gmail.com>
X-Gm-Features: AWEUYZlJN5fyyQqJMaZNefcoToyMAqIjjxYWZyhvGNhYIbG8A1i9T2wmnDZTFAc
Message-ID: <CAGb2v66q0mymn9a0uy5zyYCOKiLV+WACkM6SHoy057u-F9vstA@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] clk: sunxi-ng: mp: Add SUNXI_CCU_P_DATA_WITH_MUX_GATE
 wrapper
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 8:56=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The PRCM CCU in the A523 SoC contains some clocks that only feature a
> P (shift) factor, but no M divider.
> Treat this as a special case of an MP clock: by forcing the M mask to be
> 0 bits wide, this always result in the M divider value to be 1.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
