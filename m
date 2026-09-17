Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27183CB57B;
	Thu, 17 Sep 2026 04:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789620152; cv=none; b=ArtS8V/RqBdaAgBM5N188ARs0rpvxJ+sQ0gn3G/lxKnNFnfojh9MdfJnpNlLykP2X8DlFluoDWjQ0aJDSxRJO5khpRcRYAG01keivmM4FXAJ/XoI7ytH6qR1ZWeBNmVS7MiLG9PjOy+PQTeMKKFeYZdVUX0VUDQCclrP7BEgYwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789620152; c=relaxed/simple;
	bh=niacQppz/b/9hVFUDhV6OWRr3gN2pb0ZFT2alsHY0X0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N0k//qZxzEWvONn8Ujb49Cd6o5hInSTCM+wj8a3kFrMYfLY+fbw2MigkejbYZ6hcN11ef3LF5d7Ju57hhL8MD+SdVK/ThBw4rhB1aR+HhbBqL3DhxB+hZADFZE7WxSqAtYncTrBUIPCbOv1n58r/OPeq85A3Vij5/cJ+VbFOuN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXruVG6D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXruVG6D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3844B1F00893;
	Thu, 17 Sep 2026 04:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789620151;
	bh=fDUNtQwW4GHKBlgcaWTAtCXrAz0vNqkvuBDBQlcNubs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CXruVG6DgZDIavGOfeVwoMHjdKyof+ekGT7dlvcTypYOElqcbIjtF8bi6VCy+Scgq
	 5ze55zgC834IzZ/npFONcokqTBxyfo+ycw6pNlBUqTlR1ryxDBKvXDCZPxN2oN8BIf
	 ILmWmihHa0ZnMPT4pvvXdMB9yGB2F8QVoD80INS8TpoZyfggozfioqTswddEeREles
	 g9v6qSN9iFBMeV+/JjaI/MT1cd8c5KGJvb1NuOVoTMRTmq6LnUT1psFynjKwBnwi4b
	 09hI+Zb19QgYA091FvobZRwCDn/mhjPKH+2HOrHI8uAouePMboyto5+PFH0MY3cFop
	 QkfGnoHVx71/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/4] dt-bindings: net:
 allwinner,sun8i-a83t-emac: Add Allwinner H616 EMAC1 and syscon index
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWxhc3RhaXIgRCdTaWx2YQ==?= <alastair@d-silva.org>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260916044119.475666-4-alastair@d-silva.org>
References: <20260916044119.475666-1-alastair@d-silva.org>
 <20260916044119.475666-4-alastair@d-silva.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 04:42:30 +0000
Message-Id: <20260917044231.3844B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing mdio-mux conditional for h616-internal-emac
--

commit 32bf9c78551205e690dd92ce3a439bc48e70a630
Author: Alastair D'Silva <alastair@d-silva.org>

dt-bindings: net: allwinner,sun8i-a83t-emac: Add Allwinner H616 EMAC1 and s=
yscon index

The commit documents the Allwinner H616 EMAC1 and internal EMAC compatible
strings. It also updates the syscon property schema to support an optional
register index offset argument.

> diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-e=
mac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.=
yaml
> index 323a669fa9823..cd1075dab5810 100644
> --- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> @@ -39,6 +39,8 @@ properties:
>                - allwinner,sun50i-a100-emac
>                - allwinner,sun50i-h6-emac
>                - allwinner,sun50i-h616-emac0
> +              - allwinner,sun50i-h616-emac1
> +              - allwinner,sun50i-h616-internal-emac

[Severity: Low]
Does the newly added allwinner,sun50i-h616-internal-emac variant need to be
included in the conditional block for mdio-mux?

Looking at the schema file, there is a conditional block that permits the
mdio-mux property for internal PHYs:

allOf:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - allwinner,sun8i-h3-emac
              - allwinner,sun8i-v3s-emac
    then:
      properties:
        ...
        mdio-mux:
          type: object
          unevaluatedProperties: false

Since allwinner,sun50i-h616-internal-emac is not in this enum, valid device
trees using this new compatible string with an mdio-mux node will fail
schema validation.

The driver itself requires the mdio-mux node to avoid an -ENODEV error
during probe, so it seems the property is needed, but the schema will
reject it due to unevaluatedProperties: false at the root level.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916044119.4756=
66-1-alastair@d-silva.org?part=3D3
