Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E9C4A5EC8;
	Mon, 14 Sep 2026 21:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420302; cv=none; b=UpkwVFLKaKgT5wa7H8FqNw5W8dSd3/pXNx7t5zNVYGqwcij1Vsy9zS/v/t64MlZ70CkgPF+14EFpwyE+QZogAn6k3mRk5kGRDRNU/azDAii5Zq9d8yH9SkOeH8wS6QrEht5nyu/b/yCCbBGcnbRGnpstHoQdIcu7s/HhQ6+EAjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420302; c=relaxed/simple;
	bh=pGSEAu/g2kaG2QN4I9tvjR6mVOvHDT4VujbHedonOmU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=owvbciN5itQTwohPw9BkVNbrkhzHcmsNGs2WaKp8MpCDOdTpFYmFLs9AtI+G/hN2Tv1dgVnoMbPGZapUanVZEH0EDQIVPFuUfJ0fg8qZf6zcpbDg1/A51xl6nRDE9wA79TInyiXvspk9602s2zfcB2PfPE30lBIJEFJAhs1Vz3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okf10R/5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okf10R/5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AA61F000FF;
	Mon, 14 Sep 2026 21:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420299;
	bh=kW2v4tXGIhoaPsLlsL6oyArdwXeto9xEATBG5z4hA7M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=okf10R/5+O5HfZYvIXAXGXrmGEhWnf0wy8w6OR+1ngkVnPz5KcvT7yIsn68V5ijfC
	 xlBT6u/eetdX3x+ueQORBiiJQCk5hMW8YIyOAUX1fyYPlo1vyKKvvhHDn1pl0uCqIr
	 wT1KnJdl2xRLEIcEESnueP4eTOBRsEElz6j4Z+tX8j6KkhBIHsCJBaHYyRhL6fDsdc
	 gSJRmA/QoAuktOAj05IhmbrNf+xdgZyMchp+UD1e+aYEaah4PVlC7wZmErLJLvoZC/
	 Jq1aw7lehq0urWzB46yl5YOGzFJGSySRVYbJfp/o22+BkeCv1DFJRKPErdItTdWTpM
	 Y3b6JZrbVsTfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add vendor prefix for
 Teclast
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260914210115.28151-2-andre.przywara@arm.com>
References: <20260914210115.28151-1-andre.przywara@arm.com>
 <20260914210115.28151-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 21:11:38 +0000
Message-Id: <20260914211139.48AA61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added vendor prefix `^teclast,.*` is inserted out of alph=
abetical order.
--

commit 5eadfadaf4aefd64a40c08bf27f4fc8d4fc5a0a6
Author: Andre Przywara <andre.przywara@arm.com>

dt-bindings: vendor-prefixes: Add vendor prefix for Teclast

This commit adds a new vendor prefix for Teclast to the device tree
vendor-prefixes.yaml file. Teclast is a manufacturer of tablets, laptops,
and mini PCs.

Link: https://www.teclast.com [1]

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index ba20029693734..6da733d465a31 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1722,6 +1722,8 @@ patternProperties:
>      description: Thundercomm Technology Co., Ltd.
>    "^thwc,.*":
>      description: Shenzhen Tong Heng Wei Chuang Technology Co., Ltd.
> +  "^teclast,.*":
> +    description: Teclast

[Severity: Low]
Is this newly added vendor prefix inserted out of alphabetical order?

In the patternProperties section of vendor-prefixes.yaml, there is a
requirement to keep the list in alphabetical order. Alphabetically, the
entry "^teclast,.*" should be placed after "^techwell,.*" and before
"^teejet,.*", rather than after "^thwc,.*".

>    "^ti,.*":
>      description: Texas Instruments
>    "^tianma,.*":

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914210115.2815=
1-1-andre.przywara@arm.com?part=3D1
