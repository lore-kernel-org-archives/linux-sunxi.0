Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF1F3909A8;
	Sun, 27 Sep 2026 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790522291; cv=none; b=dqO6zsuXSgE1fk7hizNmgRtd9OGxZHGeZJAX1QXjag3gDmlgtQLL74qqR22w3W5K8AdTEmnX/t7P+sF6GlN94poty9Mjx/P1Ws2FIFC6nhczillG4NPUy1m/B8hxGtq1fwva/btarBa99YgBF/bjuyidiVdzxDHvZ+j/BnoJ1iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790522291; c=relaxed/simple;
	bh=N/pfH0xZsEfcG9/r4dQNycUrzlMbYpK9dCcAT87HA/s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NmI+zX5z8V+hfURt6g1fTQwPQwVIuR8mSlSalOOocMPa9ycQIReOoc+gWKI2WfwyNryP0Wvf3BEs55Oz/qazEfzmolzp07W4WD7YdE1jPXLkVUlCxMYGKEjw8tECkYBdusvQ8coD/TrN4wnOrGr1IQI+RKa81D+LFHwhdkSALvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f52K8ZLd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f52K8ZLd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1997C1F000FF;
	Sun, 27 Sep 2026 15:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790522290;
	bh=GC6W/3UhkOiYxyOeEuxjsTtwL/lI567R73swv/WeMss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f52K8ZLdEUSdgbhsxYBa+EtXje9rrL970nYkXn2WQ3Tadss9/g/fFeyg9+RytJi2s
	 pbeNO7N8/nuZkfU3r6HGs0YvcVCxS7y827fhg3SkZF6sJ6/+s3bElmKWaxuneAVjw/
	 vGfF8Q8kbaO/Nbmifd2gVv4IKZ+2AEORSNbu5+OZQwY6W7tycRb+6CDpOUr93pIFDR
	 ruemFAJ8kEZ7xSNx7lG1i7HHULJmbcHlBYMs3bnX99d1qLVBWmKYiI+Do7uUebiVm7
	 HOEWUfeh6309oXDQAQi7FvMp9ISjAkpbHy4Jq9LZQx7/8V4tkmNmzWa5u33uPUMHlv
	 yHqiAdG2KR1yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner
 B288
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: robh@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260927151016.186493-4-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
 <20260927151016.186493-4-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 15:18:09 +0000
Message-Id: <20260927151810.1997C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: pinctrl: sunxi: missing b288 interrupts constraint =
validation
--

commit 5d0ff1f67ca22e7e0aeb81a6bb9183820225e5b3
Author: Pablo Mazzini <pmazzini@gmail.com>

dt-bindings: pinctrl: sun4i-a10: add Allwinner B288

The B288 driver takes its mux values from the DT, so allwinner,pinmux
becomes an allowed property here, required for this compatible only.

> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a1=
0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-=
a10-pinctrl.yaml
> index 45b7a0b6c626d..6fe3b64107349 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> @@ -39,6 +39,7 @@ properties:
>        - allwinner,sun8i-a33-pinctrl
>        - allwinner,sun8i-a83t-pinctrl
>        - allwinner,sun8i-a83t-r-pinctrl
> +      - allwinner,sun8i-b288-pinctrl

[Severity: Medium]
Since this compatible is for hardware with exactly 4 interrupt banks, shoul=
dn't
it also be added to the later allOf constraints block in this file that
enforces exact hardware limits for interrupts?

For example:

  - if:
      properties:
        compatible:
          enum:
            - allwinner,sun6i-a31-pinctrl
            - allwinner,sun6i-a31s-pinctrl
            - allwinner,sun50i-h6-pinctrl
            - allwinner,sun8i-b288-pinctrl
    then:
      properties:
        interrupts:
          minItems: 4
          maxItems: 4

Without this, validation for this variant falls back to the broad global de=
fault
of 1 to 8 interrupts.

Does this allow a device tree with an incorrect number of interrupts for the
B288 to silently pass validation?

>        - allwinner,sun8i-h3-pinctrl
>        - allwinner,sun8i-h3-r-pinctrl
>        - allwinner,sun8i-r40-pinctrl

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927151016.1864=
93-1-pmazzini@gmail.com?part=3D3
