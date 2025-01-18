Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1B81632D7
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737194862; cv=none; b=VZqalI9bvqtEgCfu6Jm6/iAJ4cTNUFc1+0MjAd8Lc6RdXAgT+PunKM8Hfx/UC+Pz3euhcSuw5o6dwX7DdW49UcWDuboYUegJ+5PMMKmhAlyfuNT5NQWmaKpYbecuMCt7KmEA5qVCQWYE1hj/TLkVuKUOeVACLrdQsPD35Q3gUM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737194862; c=relaxed/simple;
	bh=9GQ98Yf/YUpW8nUBxuk3MEoc2KzBZ8x8YGwRaJGiAnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jEz0rkkjq4XUwnbQ12GrbCmFfKPlYYZy/KpQzdvjDwymoTzlhT1TC8i7U9wGsuVzWusoifivbmxm5lDjtr8LQz4Kvu9ZFoQrs4xcS/GFbUtsC55eGAPEJqR8XtugNhgj9I5Kht7gbGzAONZfGk120T/mMvg/WJVl9KNa+C4q8vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMjYXGX2; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMjYXGX2"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa68b513abcso541245566b.0
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Jan 2025 02:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737194859; x=1737799659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GQ98Yf/YUpW8nUBxuk3MEoc2KzBZ8x8YGwRaJGiAnI=;
        b=QMjYXGX2XPwj146RFxcXGhxSh7cYPn5iplztZAasi33c4iV4uY2h5GhiEjjNGfbj35
         JBK6vxiwJTwYWs1hYZ8aIzJj/VBOoFD+T968v65gF2XRuIMNFAmqKKrjLqS8vyvbU+fc
         txafW8p3D+fTHtkTdWHM0cADPcunQ0EwN+lSX69bJ3RGnaUoj5UYqYdlqlPpUFX4HCaY
         SAiF20zA9EUkuBwk8GHLy/qNn4ixojtcRJLuD8m99C4Em+XWGnCLjrG+wHcGdvJLxaph
         +B+jgdq54w8IygyLUbkIwqF2fTV6xfo+6SyplE1nrmvPPtjxDRh7A/sZBypK6mVKWEw3
         eQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737194859; x=1737799659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GQ98Yf/YUpW8nUBxuk3MEoc2KzBZ8x8YGwRaJGiAnI=;
        b=l1QUH7dkX+x/PcKVnq7Fp41S91uD1vyJ0oPoyqLvifqFTl2XfmPqkyU19MhhIIBLh3
         E+AL9rcSuhMTkssqT7s54S/Gxf6arGdsyjIoSMOYWQtiCOaBAj6GPRarVkvabMJRxB1k
         IBoAdt1NFp+Ad3TKs3/Kha93vKAA59ed2jXvrWZV48Xhf2HZux5J39e1blNPVJY4hd56
         vhKiQZRZjRUygTebPLt5noPRBgRzk/Z583B6MV1FIJqxq4Dyl4++GYdBOHzu8P4uJm23
         oOILPNyXtwBUGT5IbjgLkuzRDq41vYP21V9T+WptJ4c7IRvu386qfnMJk3Q0kmZY/IEd
         u0HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlYQ7bSDE8S/kNFc1RcIoTltqfG8TJZEDel1/7tTrbzXln6WM0XpURlU7Hbtv6TwRGpfcI9argqUPiLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyshEJ8/Ha/WjX7mm/ZRriSgWS8iKgVaT3Tw86s5PDaWsYK81fP
	oPdcn1GystXv44RqCimoxIt3tlTZcLMRMIDakJkJgfgfHciy7XW7
X-Gm-Gg: ASbGncsHxjF1odeSIsrTPbeeYI53NPQ/ssrVc0qpCGxjMmutH227I1biUxGTU+yNvIg
	6ueKcRE+TJ4dX3Oyr8uNwTc4VXMaFcWWcBKWXTvLtZwOTd60vdEL2lxPau258xtW0xn7ii0kL6S
	GML4tOWrxaY1+/c7RnHQ12XO4njXBDrflnVmRRde+95JgNOoNbKdMVGwvkBN/nmMu5G3K+8Cp8V
	fejLUJ0YxFLbffX2rUBUuYGDLJfj4C4RZF8vtqK9HBrmF6v1PC4XQZ6SJCo2dqDkPZ0aNlb5uY/
	LkUab3HjTFEl0VY=
X-Google-Smtp-Source: AGHT+IFsvrKMrEz8QcePe/YIiTwNkbTjp5GTltW896PPvrsYo1Lns2fM/cz6NBZTJCkAVR68cgnrdA==
X-Received: by 2002:a17:906:3a87:b0:ab3:a190:6cb2 with SMTP id a640c23a62f3a-ab3a1906e5cmr213892566b.25.1737194858490;
        Sat, 18 Jan 2025 02:07:38 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d2d3dcsm308908466b.81.2025.01.18.02.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 02:07:37 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] pinctrl: sunxi: refactor pinctrl variants into flags
Date: Sat, 18 Jan 2025 11:07:36 +0100
Message-ID: <1881692.atdPhlSkOF@jernej-laptop>
In-Reply-To: <20241111005750.13071-2-andre.przywara@arm.com>
References:
 <20241111005750.13071-1-andre.przywara@arm.com>
 <20241111005750.13071-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 11. november 2024 ob 01:57:44 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> For some Allwinner SoCs we have one pinctrl driver caring for multiple
> very similar chips, and are tagging certain pins with a variant bitmask.
> The Allwinner D1 introduced a slightly extended register layout, and we
> were abusing this variant mask to convey this bit of information into
> the common code part.
> Now there will be more pinctrl device properties to consider (has PortF
> voltage switch, for instance), so shoehorning this into the variant
> bitmask will not fly anymore.
>=20
> Refactor the "variant" field into a more generic "flags" field. It turns
> out that we don't need the variant bits to be unique across all SoCs,
> but only among those SoCs that share one driver (table), of which there
> are at most three variants at the moment. So the actual variant field can
> be limited to say 8 bits, and the other bits in the flag register can be
> re-purposed to hold other information, like this extended register
> layout.
> As a side effect we can move the variant definition into the per-SoC
> pinctrl driver file, which makes it more obvious that this is just a
> private definition, only relevant for this particular table.
> This also changes the artificial sun20i-d1 "variant" into the actual
> flag bit that we are after.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

That looks pretty neat cleanup.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


