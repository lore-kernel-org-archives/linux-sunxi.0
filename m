Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF483BC664;
	Thu, 10 Sep 2026 09:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033380; cv=none; b=dXdHoxpDKWbuaH5SU2X40UXkzkCloCA2pYA2MDGk3XbdKRZ/UiiF9fZBe5aezlll4dCN/G4WCUmyNPriCEHnYofTZ8Ykk8VAQ086omm2eq5cPmr4Y7yxm76ToNon/trrLwludHSGuQ3od21OR2DHLOG16Hg4EeBHFVmMbmht+fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033380; c=relaxed/simple;
	bh=/FQL4WQ33zMdv6oCe8RaBHGKfV61dhiWc0xv+AXjrk4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k423JCwOeoYWs2uzO7riWXSXTPqE40Wpu/k/EnaghKYzp0WDY2pJ1L87JrEEQ+lbF7nj93nWEnmeY358vcQ/bMd/U6rEid94iW1NK2TqjaImbVk9Mf0G2+3hnWDPiVPUlu2VCltW9F62dEDl3IIVrevP9giSxwCRQUYHzeAsflw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqlALvY+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqlALvY+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A112A1F000FF;
	Thu, 10 Sep 2026 09:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789033372;
	bh=vShnt9wWKn3X8ZG3FWjjvBLowvrx6L1p6UupCG6pDQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bqlALvY+Yu2oUOV56Za/WtfOUlxZGyKFplQexW3cTEoN/Fd8ERusgS+UPS40hX/9G
	 z/ij69jGCQ7neTI6raW/ybOkwzcXud+ylrQXniuDFD6JiamTdFLlJI/BVzYnHVRCGB
	 k2+62Qsf+sMM5nr6YDTPxCgBTMlP2Lr5fRaiyIgHf+M2/nf/NsPNYjhqBW94tbKSFj
	 GYzWzEQOrulCuRh0bnA6dIEvV/UyovNluTJRztFvroLr/SqGbzPyZGXLIDN/4Cxzo8
	 hdADM+WwlYTxcJD12Xp+1nxWmGSjLq3dWkBItOTRxQ9jJA36LQ2Vfm35CxMUtjUbN5
	 b0+bRL9akklAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/5] dt-bindings: mfd: x-powers,axp152: Document
 AXP318W
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-axp318-regulator-v7-3-de720ceb9bac@baylibre.com>
References: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
 <20260910-axp318-regulator-v7-3-de720ceb9bac@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 09:42:51 +0000
Message-Id: <20260910094251.A112A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new `x-powers,axp318w` compatible string is omitted from the=
 conditional block that makes the `interrupts` property optional for recent=
 generation PMICs.
--

commit e4119d6ce87c67baf660bd6f040790fb69b77af3
Author: Andre Przywara <andre.przywara@arm.com>

dt-bindings: mfd: x-powers,axp152: Document AXP318W

This commit adds the compatible string x-powers,axp318w for the AXP318W PMIC
to the binding schema. It also adds new input supply properties and updates
the regex for matching switched output nodes.

> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b=
/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> index 45f015d63df16..38556c32417b3 100644
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

[Severity: Medium]
Does the x-powers,axp318w compatible string also need to be added to the
earlier if-then block that governs the interrupts requirement?

Just above this hunk in Documentation/devicetree/bindings/mfd/x-powers,axp1=
52.yaml,
there is a block that makes interrupts mandatory for all PMICs except a sel=
ect
few:

  - if:
      not:
        properties:
          compatible:
            contains:
              enum:
                - x-powers,axp15060
                - x-powers,axp305
                - x-powers,axp313a
                - x-powers,axp323

    then:
      required:
        - interrupts

By omitting x-powers,axp318w from this enum, the interrupts property is
mandatory for the new PMIC. Could this cause device trees with an unconnect=
ed
AXP318W interrupt line to falsely fail dt_binding_check validation, given t=
hat
similar recent generation PMICs operate fine without it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-axp318-reg=
ulator-v7-0-de720ceb9bac@baylibre.com?part=3D3
