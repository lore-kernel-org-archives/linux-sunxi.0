Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9914366
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Feb 2025 08:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739695203; cv=none; b=eL06Oa6ecC/iLbr4HghEe7d8WnGbFXfcBaSC2idPrXzrI9CiAywxq6s+TGEzaP0hpGLhHNysSKTSNtb3siUTSc7JuQbJUl4P7I7e9lvcm1y5c/UcnczvPdt5p5gfIv6xeut4mnAddzHgNjtohzdXfQDwvVI3HZ50IQ6cp/MAm+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739695203; c=relaxed/simple;
	bh=wXpKHX0ZasccCQS/rRdK60+YV5wRpbezRfa/+sNSrQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9RJ9cHnW812S6YGYb8z1YWz+Vn+qLNw1CtAzsO340WIhKxVxY5JKwuLtOXHJKboOwag2Oi1JOFMouxGpUHxV+7sokL026oDbMCRzwvKSQI/9f+oLsVRUB78bDKl/yP2hy46DbtOc9U8Qqv6Xfg8kar0xG00n2xSuiRzSa+Cdds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d1987cce10so17847125ab.3
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Feb 2025 00:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739695198; x=1740299998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXpKHX0ZasccCQS/rRdK60+YV5wRpbezRfa/+sNSrQ4=;
        b=TDgnCfCveesJlkZA3RO1nwnucgLKsyWv1ndvCvqv6RIJVdmlCGBREi4k/W0Z+/u8xE
         H3Wlo9Mjd7nf9zPJOKrd3jAACgiEwKOurKGHMjLkYc3j0E+0oONsRDCqPL/anUeH+LOj
         FhvYBz6GrN4OswiOr1gtYpfeRVchOdQtyjoOV7QNMulWZICuYImc/Ij2PjRfhxMVVb6G
         YPVAdpVjrzmeOVBBlAoebFEaWwa0byZ2HmGEw2LdRfC4kMMXFKPWCBbEMzkLk1RBuewA
         8lxZpO/p6x4AJgWYal6f9648YOwOAtAcjIjnibSPy+fbVT2k5SGOsRBLxCZZcK7i4g5T
         zm8g==
X-Forwarded-Encrypted: i=1; AJvYcCXTv3Oueyg8s7PZueaZsJP9xFuzn6eXLqcYuabE5SDs4dKfL7Ylvo3xxaj7YTTLmllEMEZkbXQJelNVfg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEKJk51nAJxCcoPNt03k2Dn6uSKdjHpRF6o8ULJW5n84x8ObCZ
	mtXzvF07mk3mURW/fOgMl8j46Rx3SrqbJSYHyQ0UsbkEe8G9R6EXeOWltJ3nFVE=
X-Gm-Gg: ASbGnctx+1xVireeO9EDgP+G5MajxbJ6PUwxqtEHYD0qjOMkqVzLSl9K9tln+cmqO0R
	PT7Y+6Fm0Rkftp7n3PClqx7K1vb/G0UCpYljpdppzLte9UMzTiM25qiXCwvDzhusggvjwojqTl/
	hkH8wTD2pIUCV3tOk/P3r5ZRloscqhFS4iLoXsap42DNgabNzIoAzta4B4zA22RVhRssxu6s4rD
	U716PbPFO0Q96z4iIewhz80SKmhoRf/C12WZuOXc52DyfosXRAVhqY6qiv2VEeYcqJZ2eaU9rnd
	ZGNCyN1Qq+aUPq09gfpeh3RN1M3PnKPsQi/rWAnG0ZO5vICd
X-Google-Smtp-Source: AGHT+IGT3msngT9U86/vQWCrkAvcxaF7jHkdDO32lx/D57a+EzSM5bY3F+/3B1YrDU2G3sX08pLpNA==
X-Received: by 2002:a05:6e02:1384:b0:3d0:17d2:a03e with SMTP id e9e14a558f8ab-3d2809d97dcmr45974495ab.21.1739695198126;
        Sun, 16 Feb 2025 00:39:58 -0800 (PST)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d18f9c4052sm14442065ab.17.2025.02.16.00.39.57
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 00:39:57 -0800 (PST)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3ce873818a3so31682225ab.1
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Feb 2025 00:39:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhp5D0wuJRXrKy35PPTXe16GDzDd7GWmEiYpkfUiM0LdS9W1w3sTELlaawsMvh4TondSVKwpmrqahndg==@lists.linux.dev
X-Received: by 2002:a05:6e02:3182:b0:3d1:8ab7:9569 with SMTP id
 e9e14a558f8ab-3d279685dacmr46970125ab.0.1739695197464; Sun, 16 Feb 2025
 00:39:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250214125359.5204-1-andre.przywara@arm.com> <20250214125359.5204-3-andre.przywara@arm.com>
In-Reply-To: <20250214125359.5204-3-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 16 Feb 2025 16:39:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v67JF-NBLG8GBnReHvczKXgiKBYHTR15HTCtspGcWTK5ag@mail.gmail.com>
X-Gm-Features: AWEUYZnAYxHy4jgtgA_B5U0mMvfm0UP2fVTcNC4hjtdhMTuDWPQD0C_dkfISXeo
Message-ID: <CAGb2v67JF-NBLG8GBnReHvczKXgiKBYHTR15HTCtspGcWTK5ag@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] clk: sunxi-ng: mp: introduce dual-divider clock
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
> The Allwinner A523 SoC introduces some new MP-style mod clock, where the
> second "P" divider is an actual numerical divider value, and not the
> numbers of bits to shift (1..32 instead of 1,2,4,8).
> The rest of the clock is the same as the existing MP clock, so enhance th=
e
> existing code to accommodate for this.
>
> Introduce the new CCU feature bit CCU_FEATURE_DUAL_DIV to mark an MP
> clock as having two dividers, and change the dividing and encoding code
> to differentiate the two cases.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
