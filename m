Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39FD430CC8
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Aug 2026 06:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604297; cv=pass; b=r6iyvdCRZkHj9lXF59ShtNLOgJgRa7ksdkdlDscjSdf/pviRbF+vWkxubhSqqke+RlBxMH5cjFJAFGYSW1g/V5mMtDtJB5U/Hxwguoy1SfQyLV8/kT6QARJZOYnVjfG99TGl4jplTO4HGBe/9rV/2s0+Il6j09NjjV9HljQHQPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604297; c=relaxed/simple;
	bh=4bcw77KBMIYpRy8DhahSnN/xtZZNsyj77PbRJiNIjhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KuKtqKZyLStidrSZz0QIfIJ/K+oa7opRAG3RlKgcH3GZndoGX17YM13O8WM2L9tJeTxLzyzW7LGslM5eSnN7tAVF3VDhErupbo1MnwOsgyJM2F1/186L5talkt+abdzYijCKI0s180cpB3YQfLskAwm9YdKIKFdi+2uAIZM6pVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXw4nDHH; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXw4nDHH"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-74aa416ebb1so493242137.1
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 23:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786604295; cv=none;
        d=google.com; s=arc-20260327;
        b=GPD2cHaM5rxKGNgZxHKlDyWb4tAjbV9XHFKWxNR3rFdyIK+mCMUy/oNiyfVnSjvL3N
         IBmNtwyW31LOA+ElhwZ5RQlnlM59zZr30nKFxh0Aqx3RoM5fd9cBiTZ/vEnB1iVy5CPn
         3bnhgv4f+npMVr63YxnlyZv1wAa6Dh0pmUB4r/w48lBQSpFjWOPoGvSkZFqWThIrHh6v
         KNl7UFbpo/APrxJLnSwRuAMRe/YdrxmvkV0EpV9u3hyy6k9KzqrE2fusGPVYSqsDaYSn
         hyFV18nepp7J3w1ls86XY5cF3kRvE+kllNPQmaZZRrf0ZUtz/lN4rGLmEBBnz/QoYrR6
         FM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4bcw77KBMIYpRy8DhahSnN/xtZZNsyj77PbRJiNIjhE=;
        fh=xEnBYrJki4uOh4ZzUcr3yflRTPjnMznrktWVMyEMGPA=;
        b=eIwmaMMcaEK4OxZHEa0RpQ94dUGox10lf/W/XFFkqaew7E+mfnX4d9cSBpnM3duue4
         uBTB51SH7FxwxSNfKv3XgpSf+7edV8KvK4ljMZs2GfZt2wUfm1hC0t5/hyHmXMXEmogj
         DNvMpdmxIev6t6rnJhhwk2l5yI7OpnamuK1xNlC6vjYQFG54fuqt1VGzCmqACzj5+7xB
         AWtnWSc+8uhPHZS7gVoRsxoBMtmkucdQlRzgOhtddeqZd7oM9jHp4tuit2yycWoGfM3M
         SQ+EGkDvAk9Hw+NzkRkMT7+Fp1tAB7WQT3veGKt7HIRwApFMkVoTSwDUbKZaLiTjJQs3
         to4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786604295; x=1787209095; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bcw77KBMIYpRy8DhahSnN/xtZZNsyj77PbRJiNIjhE=;
        b=EXw4nDHHHOCSl4iTQeJNhsWuynqDMUd4I8EMF6JaglyJ2yVgVBid+/hZBJHq8KqpBj
         bnPbw0uA8QMDgzFutWeBGq8cf3nHW4VKj8xdx8k2OoHbp1SMN15rQ4/cSf8CizYTq8Rz
         hYkaj8dghoDUj4NF9MfvV1UBrgJ5XQQcv1S7OJ28EdacfA5xPZg8/t6bL0yaUhod1pcg
         pFjdayZzRKSppVVKivQC49NKm/MNR/nmQMV2v5S4H39G457h4bNboO9zPwg65pd4Y8kN
         qyhETn4uL4gNAK4tlK+KoUg3T3VftgAdpFWZbrPGGeNJX6itv+choZ8hjd4HXzvurt0v
         juRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604295; x=1787209095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bcw77KBMIYpRy8DhahSnN/xtZZNsyj77PbRJiNIjhE=;
        b=NEUknz3tqt3K25PoRsD0H7J7NZDUS3O4fS4HFWPQhGWDsDT5WHfPk8f3jGREaRRYll
         ZabVbb8eXhPVHa7pbgutUXa59CabPd36FrRTbzxEcU5Mk5Dzkru445SzbeREkYBR+PS6
         xaT7sPd5s7uOgBMm1EIva7Vq7nkvvytlplUUvt21cJtPJq6Nl7i5ouqUEtqN1y7ekkDb
         0Bq0PkXaQUgJfdZNn5GiDd6c6ly6heEwkitOuWGl93H8EkPDUBDnX4AuZgA/uks/VkkN
         6VkPeR0E+TiUKA+upZozFlePeJFHng3KaambmN9/2svR0tQoQ9//9S3245KXdjjOWE+T
         F/yw==
X-Forwarded-Encrypted: i=1; AHgh+RptMW4pkz0xdBWoISgjbZkT5jXt1+W81fI7T37d9bSo8Xw9EJozwpm6btaKUqykfHIewyhfDKHAlTkFAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5gWtaUMI/feiGsdzFKaHr6q4AkgnX4Vnvwv7N3Sb2zhTLAlBw
	HJFy+yKWtcK2CJIKUXizhTM3XrvMOWObuc7ROyOPXL1eGK+gcX7ZNpf0EkMYl3mnGSXXbTyqNNT
	iB0mS+A2oIx+GMvruvmUyBLiNsWpdXDY=
X-Gm-Gg: AR+sD11Bm/+eOJwZHPUnGt9H6yeSggB8h3X4ALk4UwqCt5HrosB3/UGWbC+5eqG7TjR
	wG/pUG7NgMiM7ObPxsgud6mhGKkWCn/kNjLrw+PfvVKR0BNwGZLVgdoi726gmV19xtWBeJmW73n
	5+xKIGfdp56thAbpOJITch7ztyh4+dgWFNzS2D4Zc69RisaqgQuQqZ3/BEJ7IPwWL1Hpl2nNz+R
	e8SqYpzPe0UJqbH9b7Y0daYzql6pnNzXtTv0bb0CDwWt9rltF2kCnORnC124lEwdUcegNkGuIx6
	M09OPb0wXe4x1OeFqe9ECvx+ZgsD/tKiRmt3RB9pZ80hcUgygMNQW0Dn4FQxfV3XuOuP69Mbh9x
	rIlSLbDDhhxyyAXmBXT/YuEEtS7Xgi1jtSb38KJ2Wqk+TxPd8tzZPBNEOm+6wKd3cYPRIG+yN/k
	3Ey6mI2Wj/TxFoC0UfzcI05naPR0cv34IPKxm1
X-Received: by 2002:a05:6102:c09:b0:6c3:1bcd:31dd with SMTP id
 ada2fe7eead31-76db5c7db09mr827543137.6.1786604294775; Wed, 12 Aug 2026
 23:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
 <20260811-submit-ac200-mfd-v7-1-8b06f552a4d7@gmail.com> <20260813-independent-ladybug-of-perfection-1afe7a@quoll>
In-Reply-To: <20260813-independent-ladybug-of-perfection-1afe7a@quoll>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 13 Aug 2026 00:58:03 -0600
X-Gm-Features: AUfX_mwgvEsp_avZ39gMBtOXoVUSCDbwgKTbjWWmofYwkFQgC4t_LLBxQm2wsU8
Message-ID: <CADvTj4qaiyEtKk8bSj6Eq=q=KJ5pO90Aa0iJQrysr2LR3QuAQg@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: mfd: x-powers: Add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 12:49=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Tue, Aug 11, 2026 at 05:11:30PM -0600, James Hilliard wrote:
> > The AC200 is an I2C-controlled mixed-signal companion IC containing
> > audio, video, RTC and Fast Ethernet PHY functions.
> >
> > Describe the parent device and its shared input clock. The Ethernet PHY
> > is represented by a PHY package on its MDIO bus, with a phandle back to
> > this device for access to the package control registers, so it does not
> > require an MFD child node. Function-specific supplies belong to their
> > consumer bindings rather than the shared parent.
>
> Other way to represent it is to put ethernet phy here - either as a
> child or folded into MFD device node - and provide phandle to MDIO bus.
> We do like this already for several devices for I2C case with "i2c-bus"
> property. Here it would be "mdio-bus" for example. Such solution feels
> more vendor-agnostic, easier to re-use, however I cannot find any actual
> arguments against your approach.

The PHY package remains on the MDIO bus because the link PHY is addressed
and accessed through MDIO on both AC200 and AC300. Only the AC200
package-control registers require the additional I2C path; AC300 exposes
its package controls through MDIO as well. Keeping the package under MDIO
therefore gives both variants the same representation, with the AC200
phandle describing only its secondary control path.

>
> Maybe Rob will have his preference, but this looks okay for me then:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>
