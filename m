Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E317C224
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Oct 2024 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727968358; cv=none; b=pH7ATjgExwlwNd/2oX/oBI5StipSDdzr7Z0oVbAJ11ANePUeMY7Vmm7BpMMzTL/F+P2TpDVjDEyLgSmYbITPKXGeas/owNJ2F1otGFK73kYrrSpSYiwe27HyPqiiEICcRB/v+satjMoxZYIoHuh249dYlYV4EZO+3HWnRAH5epU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727968358; c=relaxed/simple;
	bh=gwKW4ycAUTNy1tipNB505j/jZ3lNfe3SfserdHNQQkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMQViShyXL35WHUB/PjEGhYaaaKfakGHC9eD2V3fZ9pO+YiRs043bI7m+ii5E5FWzz+Ie2jqRBDTpobQBURSCVzT+ewLH8nAjEdyY3B1FJZahgpOdzo2+Yflr34L3fHY4kPvz9xeneTl0WaWlcAda7F1Jz7qaz6wevqHxNNjheA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-82aad6c83ecso44048739f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Oct 2024 08:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727968354; x=1728573154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47KD1hatbg94UjbGvu7DyHwu3QN5WNe4psfvAfpMbAE=;
        b=ZbQocOmvv4q90825T8nLRmLhdpOGMttLHyKLNhFTxfpQZQsJWRQDOnleUM35UAaPv9
         sKR5DQiHGowSP3lVI6/k8mxAl0XlUvWaLelNllgtadtQBnzOEZpaHeYxY6z52qToDnvp
         Mjok9T2eI8L+qROvp/ebjdd6x3ExGPztncWIT+iC7LTS8+ILe+2QIAMWC6EAYssXbX2m
         bd4GSZ+hv9LHAH+YBZaagO1lsua3jHtotegsN3VZpMmDDu7/wr/kZY4ajhBeVjqr9F+m
         nohcwVvfZPXD/ptMeaan6Nqqgo5+hB//V5TBZkzXZtwUrj3aLx3Axw21Wn/ugSCVq74y
         SBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPIUWK3lclBZTE76dKUluSZdJWG7b4dbjSZ0u1N+y3u8Z1vptTn3ro7PMS3BRliMJ0bSLXskGjx7o69w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1DCPUZoVzep2nEF3nMGbVugPrFS0VE0bBlw2aAZYHimP05QzR
	jfh4nNstX/M5VO1XCl+YpppeDNQx7VV7CrltsqUAuwyjXoOh+n+8SDQv/JMK
X-Google-Smtp-Source: AGHT+IE14QjayCeewgOoCdUd/rXSNTwgTHYfRYC1CQFjjSBKf9hkiRMEKtQwMjrFa8fVmOJryxRALA==
X-Received: by 2002:a05:6602:6c01:b0:82a:3588:994b with SMTP id ca18e2360f4ac-834d84d0b75mr774796639f.15.1727968354454;
        Thu, 03 Oct 2024 08:12:34 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-834efc986e2sm30018639f.22.2024.10.03.08.12.31
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 08:12:31 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-834d3363a10so49601839f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Oct 2024 08:12:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXfKcNkaR1mSmRJg0SySYwIt/X9gTCyBFaSdV0RKbIemag+yunDC2NUvmk6X60Tlg3HUUbHLBVDiOROA==@lists.linux.dev
X-Received: by 2002:a05:6602:634e:b0:806:31ee:132 with SMTP id
 ca18e2360f4ac-834d83f7467mr701739239f.4.1727968351148; Thu, 03 Oct 2024
 08:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241003111444.543964-1-andre.przywara@arm.com> <20241003111444.543964-2-andre.przywara@arm.com>
In-Reply-To: <20241003111444.543964-2-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 3 Oct 2024 23:12:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v65vx+9gD41yK_gcBSk2_GQKLxn1O806RJ9HpMqMA1gDAQ@mail.gmail.com>
Message-ID: <CAGb2v65vx+9gD41yK_gcBSk2_GQKLxn1O806RJ9HpMqMA1gDAQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: mfd: x-powers,axp152: Document AXP323
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Martin Botka <martin.botka@somainline.org>, Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 7:15=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> The X-Powers AXP323 is a PMIC used on some newer Allwinner devices.
> It is almost the same as the AXP313, but supports dual-phasing the first
> two DC/DC converters. A pure AXP313 driver wouldn't know about this, and
> might turn the linked DCDC2 regulator off, as it does not seem to be
> used. This makes the AXP323 incompatible to the AXP313a.
>
> Add the new compatible string, and treat it like the AXP313a.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b=
/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> index 14ab367fc887..3f7661bdd202 100644
> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> @@ -71,6 +71,7 @@ allOf:
>                  - x-powers,axp15060
>                  - x-powers,axp305
>                  - x-powers,axp313a
> +                - x-powers,axp323
>
>      then:
>        required:
> @@ -82,6 +83,7 @@ allOf:
>            contains:
>              enum:
>                - x-powers,axp313a
> +              - x-powers,axp323
>                - x-powers,axp15060
>                - x-powers,axp717
>
> @@ -100,6 +102,7 @@ properties:
>            - x-powers,axp221
>            - x-powers,axp223
>            - x-powers,axp313a
> +          - x-powers,axp323
>            - x-powers,axp717
>            - x-powers,axp803
>            - x-powers,axp806
> --
> 2.25.1
>
