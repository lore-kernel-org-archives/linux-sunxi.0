Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7218C2DC781
	for <linux-sunxi@lists.linux.dev>; Thu,  1 May 2025 05:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746076326; cv=none; b=j1PZ33XLfrex47ob9eo4OtjpkjjXyPpZj8OQXERpEbwRkNJVkL23uEZOP96oSfu5yP+rv1/9RA0xXZ5H2vS6KPgzeiN8vHgKhMvjCLHMuRwtmWivAyJORtTxs7EZez8Nq39/AoE8fi4/akpPG7YR6zeOeyl4783DpCVb/Yh4+4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746076326; c=relaxed/simple;
	bh=y+e4LNh0a+mZT7KuvkuNN9QKvyqkFkWCWi3RGovQ0vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7BNBWK/ybWUDlvJpC29hSe7R6CXIMB/xT+dF/bDVc+87ugyG4bC4k3B9wP7txkCCxbx+46qHIL7g7SMU03QZUuCbFnOdHg887lrTylDy8b/+1ug+pJKfSqlUs3cAZAMkBGbKJicUbwvhmvuHFOCRL9vrlFcEXqfx0ugTZS/tJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-548409cd2a8so653782e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 30 Apr 2025 22:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746076321; x=1746681121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ajprlg+s4993P4LGMO5ZNBmeiTXr19klHoz0G+I0WL0=;
        b=YqYncdTV1l+tyqfDQett9DYJbnSa7Jk+0dj6aggFu3k2nCd/T2uJc8DhOKhBRUIw74
         2oeGHuBcmzv9+RTJKzNCUSumHQER/zerRhQWb0/vfUVCSheHvIsdaAGbXSmuEmDwEcd3
         XDvN1FUGzcxEr8LLEyrRa97KgNdDy6RqfkPt0aI7ZLzrQ/pZSKUnZyjuARrGlawLJ2jT
         YrCpLSVP5gGHsH+79WWXNdnxJ+1fBpp6JoRuupW5Fgtpv8Ib+aimVIoAZxqxrjYw/wVz
         4OThTd1/Olwdj3PBJ49Ar1I7kp/Rz4UxFHzP1glShOEapf0UCtPLV/yuHrt2eN8lU5ZC
         lWZg==
X-Forwarded-Encrypted: i=1; AJvYcCVxLMGsMNom/tk9H4CF18kEJvD5d1KjBlJaZeOEaENWc1Acwn8yPoFiCD8bawHZsfL7cvcNzs/SvcnIqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxErXelJts40b45lq+s/2gP7CcTXTMHYfymWKHp+tVcQqLJwEVw
	I1r/KwZh/t3pqNJNy/8kvnCdhdKYrgECpBlYbVdbVKhDYrPDX27bmYSpJ64k
X-Gm-Gg: ASbGnctTOlpeVftYbQO32OaI0f1UbhT2Ap2aaRfBsJ6JQNZGCj1x+eeSQVfDWf8b/pp
	DlN4GeiB8hSxB6cvKPi/BZNG8+VzddaKduJZMRzhFhwCpYOlnFHKfY1W2pi2UuOSoau8JYRoRwi
	Rn8LDZupNucQBJlMlFUr1rI/bNhJAenOuyVPmxYQDXmSwqEEi2myJIr9FT1BVACaCxGlCjAC8W3
	IhR+PggjzIx42/JGwKKQJz18i+ekNWma7rKsKwcf+AVmm7vBb0trwZ/+ji0zhJDbf/XALFR7tF5
	nmiyLQxXDR3xi72tVdWMYLahGAdwXbntiEEisi1JfWvXMBwEJ0pm0QdIeucqLLn3nbXjnTNp72n
	V7+l7Gym5
X-Google-Smtp-Source: AGHT+IEafCDum1aygRrDNdJdmsKBOgweT/bPbvWCauXhpB6wyqZVCMHshyTFubd3gawQ6GB5elXrJQ==
X-Received: by 2002:a05:6512:6cc:b0:549:91c6:96a8 with SMTP id 2adb3069b0e04-54ea7260f08mr318927e87.7.1746076320478;
        Wed, 30 Apr 2025 22:12:00 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea7647c83sm91912e87.213.2025.04.30.22.11.59
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 22:12:00 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so4858561fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 30 Apr 2025 22:11:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWTDKLHv9ZHyTgTIXfn3Ss95brlX9oMJi5VgC1ep6OFquVCCRpk1/JgbHvfgzTp9ti7HLKuWvhGF3X/A==@lists.linux.dev
X-Received: by 2002:a2e:a902:0:b0:309:23ea:5919 with SMTP id
 38308e7fff4ca-31f950cc7admr4279341fa.31.1746076319318; Wed, 30 Apr 2025
 22:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430095325.477311-1-andre.przywara@arm.com>
In-Reply-To: <20250430095325.477311-1-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 1 May 2025 13:11:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v65-YTLbzwxE_X31+Rc76FA+POjEejCCAhYbMxge3175KA@mail.gmail.com>
X-Gm-Features: ATxdqUHTuNPlh61n7f8lB4pnNO-UYTl-k-uXFS9Jz53D2xoCXFTQKPt4GQyFAJU
Message-ID: <CAGb2v65-YTLbzwxE_X31+Rc76FA+POjEejCCAhYbMxge3175KA@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: fix order of arguments in clock macro
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 5:53=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> When introducing the SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT macro, the orde=
r
> of the last two arguments was different between the users and the
> definition: features became flags and flags became features.
>
> This just didn't end up in a desaster yet because most users ended up

                               ^ typo?

Will fix when applying.

ChenYu

> passing 0 for both arguments, and other clocks (for the new A523 SoC) are
> not yet used.
>
> Swap the order of the arguments in the definition, so that users stay
> untouched.
>
> Fixes: cdbb9d0d09db ("clk: sunxi-ng: mp: provide wrappers for setting fea=
ture flags")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu_mp.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.=
h
> index b35aeec70484d..8fc7fdb7ef494 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.h
> +++ b/drivers/clk/sunxi-ng/ccu_mp.h
> @@ -109,8 +109,7 @@ struct ccu_mp {
>                                              _mshift, _mwidth,          \
>                                              _pshift, _pwidth,          \
>                                              _muxshift, _muxwidth,      \
> -                                            _gate, _features,          \
> -                                            _flags)                    \
> +                                            _gate, _flags, _features)  \
>         struct ccu_mp _struct =3D {                                      =
 \
>                 .enable =3D _gate,                                       =
 \
>                 .m      =3D _SUNXI_CCU_DIV(_mshift, _mwidth),            =
 \
> --
> 2.25.1
>
>
