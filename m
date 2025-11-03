Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC2D314A64
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Nov 2025 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762183926; cv=none; b=N76xXncn0ExKRkmL7johK5sjs3/NDlSnoaXow/mMQOzaJVDEy8OQIvrpdwy8bv0ang8Ti5Z0mjZco3k5Oj4SoCDmU7rEQvx9UK9PjdxlwytgnjGZIARUcmECb9lNyyHsKhwZ4LY+LDuEslOop7mNMbBqXHdBR10igXIdhUAItyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762183926; c=relaxed/simple;
	bh=ldTrccz1k3zG5hsrIjcrfaT0TLAHWdfHQVOzowj7t4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=omZEYyrlRlUjQ8TxEEA2giHgNYA7Y4h/lucT5ETbUT2OoqL1r74Ezv8S73mARUaPH5NNfFbODJVyj23FUBtoxjvShBlJusxWpQN9eLiL0rn0rHTPulqDtSDUrM8FtWlPybP6TbHb5eSQL+nh94UDMVdzEcZQTsVSSHboeMiTNfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHW1bptP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHW1bptP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A924C116B1
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Nov 2025 15:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762183926;
	bh=ldTrccz1k3zG5hsrIjcrfaT0TLAHWdfHQVOzowj7t4c=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=iHW1bptPTj7YcLVlF7Jt/biFtxge9HcXhz/k8iwgSRk/ELpPj3CQsOZfDkVDGZIKw
	 hcZQmD2WevfvmzZ/Bm5vb0i4IuE5nVtL1YZSdx54qMvtdERFNOSBveIqySY/k6oGko
	 tObBC9oSBAxW3d7IsW49ZRTQmQTKbvhtbHYHK8jXdMkRRfDBVWoQ1R64vYJlwMHYGI
	 BPSbJ4rWBbeOentQ4m30iNFTt6+253ob5ivrwEshGQAwU3Fr8hGzdN87mX76fkQLTU
	 oixZZVPgoVYXHSHrWAzm2BmdfGQhIQuaqgdvvTkC0tM34+RAPoH9RuYOG8TmpeNa/Z
	 jvb9zkgpBlHrg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-591eb980286so4399737e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Nov 2025 07:32:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtUQ8G6MfeZTIiFk3H0C3Xk8Mifw+0DQV77RtSvX303oxpAetrGV4xkQrYbuz0EyhjWTZO1QULrVxXwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuZRsYqZcW/DItlOsZv+SFYy69Nwh23QDZ9ak3O3Dmtzdh/vIW
	5FADm5qVcIvPIUpEmMhU1e1Y/t4DbIrG0r3y4C7Ir+vGFKPNGpebw2dFBV1RR+wSZqMdv3LYH2J
	W7WKELNDqphzTjL18DrryojUJKkWNOxo=
X-Google-Smtp-Source: AGHT+IGuWwcsHwoNWGeiPIp0twN/5zmHhQZ8LukItMA7GwGypBE7eupUKitovFzPUZOvSlsivgqP0/+UP9fA+PX7v6c=
X-Received: by 2002:a05:6512:1102:b0:594:18cf:14ba with SMTP id
 2adb3069b0e04-5941d549648mr3516863e87.46.1762183924565; Mon, 03 Nov 2025
 07:32:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251021112013.2710903-1-andre.przywara@arm.com> <20251021112013.2710903-2-andre.przywara@arm.com>
In-Reply-To: <20251021112013.2710903-2-andre.przywara@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 3 Nov 2025 23:31:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v657XU2wnhNHCgpLnXQrRkVBu1v5SNLUhnXcbj3RfCBN7g@mail.gmail.com>
X-Gm-Features: AWmQ_bnVIYEAzXsQB-a8g3OFWbeWjAuTTfVmtcOlhHp2hFHoVPwHRCT0lX6q-_g
Message-ID: <CAGb2v657XU2wnhNHCgpLnXQrRkVBu1v5SNLUhnXcbj3RfCBN7g@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: x-powers,axp152: Document AXP318W
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 7:20=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The X-Powers AXP318W is a PMIC used on some newer Allwinner devices.
> Among a large number of both DCDC and LDO regulators it features the usua=
l
> ADC/IRQ/power key parts.
> Like other recent PMICs, it lacks the DC/DC converter PWM frequency contr=
ol
> register, that rate is fixed here (1.5MHz on DCDC1, 3 MHz on the others).
>
> Add the new compatible string, and add that to the list of PMICs without
> the PWM frequency property.
> Also add more input supply properties, for the split DCDC and ALDO
> supplies.
> The PMIC features *two* switched outputs, hanging of DCDC1, and the
> manual calls them swout1 and swout2, so follow suit here and add those
> names to the pattern for matching the node names.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/mfd/x-powers,axp152.yaml         | 28 ++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b=
/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> index 45f015d63df16..1bed19fc91ec4 100644
> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> @@ -83,6 +83,7 @@ allOf:
>            contains:
>              enum:
>                - x-powers,axp313a
> +              - x-powers,axp318w
>                - x-powers,axp323
>                - x-powers,axp15060
>                - x-powers,axp717
> @@ -102,6 +103,7 @@ properties:
>            - x-powers,axp221
>            - x-powers,axp223
>            - x-powers,axp313a
> +          - x-powers,axp318w
>            - x-powers,axp323
>            - x-powers,axp717
>            - x-powers,axp803
> @@ -156,10 +158,18 @@ properties:
>      description: >
>        DCDC1 power supply node, if present.
>
> +  vin19-supply:
> +    description: >
> +      Combined DCDC1/DCDC9 power supply node, if present.
> +
>    vin2-supply:
>      description: >
>        DCDC2 power supply node, if present.
>
> +  vin23-supply:
> +    description: >
> +      Combined DCDC2/DCDC3 power supply node, if present.
> +
>    vin3-supply:
>      description: >
>        DCDC3 power supply node, if present.
> @@ -168,6 +178,10 @@ properties:
>      description: >
>        DCDC4 power supply node, if present.
>
> +  vin45-supply:
> +    description: >
> +      Combined DCDC4/DCDC5 power supply node, if present.
> +
>    vin5-supply:
>      description: >
>        DCDC5 power supply node, if present.
> @@ -176,6 +190,10 @@ properties:
>      description: >
>        DCDC6 power supply node, if present.
>
> +  vin678-supply:
> +    description: >
> +      Combined DCDC6/DCDC7/DCDC8 power supply node, if present.
> +
>    vin7-supply:
>      description: >
>        DCDC7 power supply node, if present.
> @@ -220,6 +238,14 @@ properties:
>      description: >
>        ALDO* power supply node, if present.
>
> +  aldo156in-supply:
> +    description: >
> +      ALDO* power supply node, if present.
> +
> +  aldo234in-supply:
> +    description: >
> +      ALDO* power supply node, if present.
> +
>    bldoin-supply:
>      description: >
>        BLDO* power supply node, if present.
> @@ -277,7 +303,7 @@ properties:
>            Defines the work frequency of DC-DC in kHz.
>
>      patternProperties:
> -      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)=
ldo|cpusldo|drivevbus|dc5ldo|boost)$":
> +      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|swout[1-=
9]|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":

This and the ever growing list of *-supply properties makes me wonder
whether we should expand the conditional blocks to enforce which names
are valid for whichever models. That could be done later though.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

>          $ref: /schemas/regulator/regulator.yaml#
>          type: object
>          unevaluatedProperties: false
> --
> 2.25.1
>
