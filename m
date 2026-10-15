Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783CF350298
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 02:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032435; cv=pass; b=T7b7H0+wyWqIR6KkeXAv2Joy+2dK6ZOCcFFEdlYANJE6v1g8nlHMrrk/io0sbOdJgNeu5lKuqmljTbkEAVlw8Dvoj5Lp6ErGlFge/Wjp4salcZEoiq2M06vos8UNsBGC+8DMpXLaIhkYeFKLqFUdKc6V9aowj7x30+d0bntLloY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032435; c=relaxed/simple;
	bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5WuIPjmW23IOGnzBlWtVhWAbn0b1Pa8OqMQQiZZB0HMSSwLMfEuEQsL/3d4FvsFlY9k4mW05JO1Rcy5WNhYsWd/UjDV0EXNRAaoQOgwwgTJmGyLdOxuJFjBJysc3IvLIba3F+gzjmjAuhYa7AlllN+zJWuNclJU8MBIbUbSN90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jj9m2OQu; arc=pass smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jj9m2OQu"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99075306daaso85015241.3
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 19:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792032432; cv=none;
        d=google.com; s=arc-20260327;
        b=LJRH0CGEh7ZLeqClIgM2i4Gv7JTSHSL5Rwz8VAoT44wq3gA0BIKbXgitT2E+10mXSe
         2A5nbGVf0ZLDbuGVt/+zVBdsp65ngyb+Nvo9hDSDsmjmHWELMWYOVs9Bl+aEcVIbkvS1
         i2mE5PmjfQ9pIC9UgHtRIlJ/SrOBanMhZOegRL2HtXRn/fRe7UF4f/E/uwRIsip31tNr
         jZhxBwqv0TSv0YBa5JXKVH9nb1NpmmP/SwIBpgYzsPanIO0x3NZDgz6ylUWxj1KB++l8
         zuy7F+ILD2ae3YHDgRGVAOb3iZWy0lcDkW7QcZS7yT6BbklZG1gPTLogVpcsOJQ4Cmpp
         IvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
        fh=XRHcd/LAdOAznFIuF0xkpanLtB21gAoLZMffSM4JRKI=;
        b=T8KRBGxL97OxSmviRHlbOtQQQoyOAK9+4Qy1/TVkgu1qeheTAtFxP7FU+/dJybpXOz
         HTQRuIjKT3tXAHckvWuoaYbgiSODme4iVHcZDW7LUHL5QNeZdWvBKBZCrtXlCPpdOp1h
         7AMUZTKTv2bpp5WAUKqbCo4b3g7JvwKTqtaBVyjlxENQ6NAJN6Mf9Fv5MuYFFEvgFW7Q
         VfYQkHvN/AoH7t+MB4lu0MVq/KCkD6C1q5oBSzaWKA9Qpeo0wcoQHYqymfGqK30RP179
         xqtUOe8mniXFG0BomsleHG2MN08hO6qfaFyJ4wHP3d47QcJQ6u7OWyT9fHzB7Jf3oJFi
         rYpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792032432; x=1792637232; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
        b=Jj9m2OQu1PtUA+F9ykgjEfCjtg3itsXorn/FU1mFB9GqVE/8p4E8OmdFbsobSSMCy3
         BoD7RADt9bVojAlqfU6Wi0bGHp13dz9li/Ke55UVnH+UZz9v/88BUYI/B+vc+xZ9YHKF
         5F045ihTaMcU3y5ZARtw4oWkE/vSRMxKvh3RFYUI4bBruGDqDf+pXVsU42zCapY/8r4c
         i3DDLJ52LGfFv/3gne8jo2NieP1FNP4tBiLDWlKWSQoE4vO6Gj6lgcxRbBZXuAxhe9PA
         eCKe4aN2IHFbTdJCg/9fqp0M8eVupJecxw6B4HYQnHgFhc8UNYUTXZzGd3uhWsmeHgKi
         5t0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792032432; x=1792637232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
        b=AlieMj6FEdpv4Gb6oS2VedPKlyQSrWl8gFIRZMSNfkNyXdo1wVYeMPZZ6WZpNM5gO/
         k3c9xTiQ3taobotYLuwP8gvJuYMpWuRHtEXSrE1tZDaMehyC8ALvNaz8AEB4JbAO4wuw
         AzkiKrx5RSng7xvcjyGVvHmQF3Lbd5OQHtWBL8wTeQCrG0H3/3njD1Mj2NtI9Eni0BJm
         nfQkASJMZdLnxtDFCYdtyK3k6xRJfjhGySvDjlWeBl15KZVGvrJrGV/6fSg2JSI0kjVD
         1wfmcEDRsTA3k8Bqdgi6FgLKni7KSQIpHa0oZSJD6XF3LndpdlLyGxss8wspjZPXflbV
         EeXg==
X-Forwarded-Encrypted: i=1; AKwUvBzdqh5/wrNS0/gkcihxmrNS0Bgp49tikn69U0bvbzxOPmi9uUx9uv+TwwT7kS4UvKeTntkoPb8vR7CGFA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKxMGtGnaorvytEUJIjvIhrXIOLKeFeN8ANvUCoXy2/E/tQo52E
	Y914EugdkCjA2nc6c1V00eEZslMBSH+su/MekX/qXi7dTYUsTby+KG3KLrgysa4dXd527hTqAh5
	/8nyb41KhUy+N+8G2ZYb+FqZMs/5E8b4=
X-Gm-Gg: AYBFou1Fxq25bOe60+3vXJ6knjjrUALqvW6ZzcMkV29sEYDNOF/MvtCm6i6nBKf/v9X
	ZZMYIdCRjfElTCLesnOfjr1z1o3tBw2cdn3Ezl/kbenHOUGPBzZ7nny5Cqnho2EVKyUi3dM33rQ
	Bv1/2+yiVW3sHRP1gM6wF7jTOSpQCsdk4oqucGizkphrrRtErKiKIofz3NQHGhe93Ge2xSeooNp
	w5OvRwIMiPmRgwBAsMlFlaBjJFK/I8ZsOpBjwfAkqEHuu+zghURxJVp7kBzQhN4LMIdqjhNlOa9
	expG5dn42hJb8QYBQK3RvoOHknlmM9MngiwdQM3oRhmYe9ssZf1FrJ69tut8uJwqD4oLPfWxnvS
	x3q7TuHdRRwj2LmrL4RQVCHK73lAvHTxrT4uOMBsrtP4KfYhJH2kiYraj9d3hybvJ+REF90DwbG
	FOPAchseDWfJdPC2dAx2eKwgqzDxFfxgJIW2xVYmJCuFOk
X-Received: by 2002:a05:6102:418b:b0:7c3:2f13:d905 with SMTP id
 ada2fe7eead31-7cb3668b831mr6416805137.3.1792032432146; Wed, 14 Oct 2026
 19:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <871p9v4a1x.fsf@bootlin.com>
In-Reply-To: <871p9v4a1x.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 20:47:00 -0600
X-Gm-Features: AclHuK8WjfPBl-snALh8yjK0sT9hEMdsL68lGw63Y8O6sDBZaP8Ds_BfAoAdcJg
Message-ID: <CADvTj4oCVOBiY-55OJt3xFaOiBrFVixmK=AmTRt40iEisDSO2g@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:06=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hi James,
>
> On 14/09/2026 at 15:09:46 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > Allwinner NAND firmware leaves the bad-block marker in the randomizer
> > data stream. On H6/H616 it also places all protected user data before t=
he
> > first ECC step. These choices differ from the mainline format, which
> > keeps the physical marker plain and maximizes the H6/H616 user-data are=
a.
>
> [...]
>
> > Assisted-by: Codex:gpt-6-astra
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> I am sorry but I do not want to proceed further with this series.
>
> Even though I am not capable of finger pointing what is wrong in the
> diffs nor in the commit logs, I do not understand most of it. I cannot
> clearly explain why, but I have had a hard time trying to understand
> what the commits were doing.

I think I may have identified a substantial part of what made v6
difficult to follow. Format-specific handling was interspersed with the
PIO and DMA transfer paths, which also implemented similar ECC-result,
OOB retrieval and erased-chunk handling separately. Reviewing a change
required following those interactions across several functions.

v7 01/16, "mtd: rawnand: sunxi: centralize OOB handling" [0], separates
those responsibilities without changing behavior. The transfer functions
retain command sequencing, DMA ownership and randomizer control.
Per-chip OOB operations handle layout setup, marker transformation and
interpretation of completed reads. The existing formats share their
read-interpretation logic.

The Allwinner addition in v7 16/16, "mtd: rawnand: sunxi: support the
Allwinner randomized OOB format" [1], now has a clear boundary: its
layout and page-classification rules live in dedicated callbacks,
selected through the opt-in attach path. Its erased-page and bad-page
policy is separate from the existing formats' interpretation.

Common hardware helpers remain shared, but adding this format no longer
requires scattering format-specific branches through the PIO and DMA
sequencing. That should make both its behavior and the preservation of
existing behavior easier to review.

[0] https://lore.kernel.org/r/20261014-submit-sunxi-nand-vendor-oob-layout-=
v1-v7-1-5d3fc6ad2da1@gmail.com/
[1] https://lore.kernel.org/r/20261014-submit-sunxi-nand-vendor-oob-layout-=
v1-v7-16-5d3fc6ad2da1@gmail.com/

> The risk is that nobody would then be able
> to further maintain this driver and I am not willing to take that
> option. The kernel policy so far has been to ensure readability and
> maintainability, and my gut feeling is that this series is going
> sideways wrt this major constraint.
>
> Also, from a Linux kernel point of view, we generally just do not
> support vendor specific layouts. I already told so Richard Genoud back
> when he was working on H616.
>
> With this added to the pile, I prefer not to merge the entire series. I
> can still take some of the fixes if you feel like they would be relevant
> anyway. In which case I invite you to send a v7 with just the few fixes
> you think are actually relevant outside of the randomized layout
> support.

In v7 the behavior-preserving refactor comes first, followed by separate fi=
xes
and optimizations. Patches 1-14 do not depend on the binding and Allwinner
format in patches 15-16, so they can be considered independently.

>
> Thank you for your understanding,
> Miqu=C3=A8l
