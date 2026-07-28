Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D3F3A425B;
	Tue, 28 Jul 2026 14:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249656; cv=none; b=GLBuE4s6zWNoMzISWXY/cTHIAne1b2dtLVgukeU71UsketEd/mHZ8hheskTXXzgWL10rmsIIfDkibNo5JAYeegwrEvyh1Bl6ppd0JPTODCwhzg8JLAc/8V1B/3t3ANUSoCyY+YdhHKtQ9lDsKwGN0DEKcTzkzJPh3vGW4hAtI8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249656; c=relaxed/simple;
	bh=Hilz4x8U/G9ZNRZ18/kOn3nRS7xSxQ0G35VENiHioBQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m4XxaMqECjaHozYJY//fP5zTsAaMHhCZ6XYwJnBHckswYAtNehmFurIQ3rGspAJiMboZW491QFhQLcNRbj85sbKnDK1GTnPKWhcA4T2LEdrb223yWIugXcNNTqgNToE6YuBJEl0nC6ETs0e3HyJj/Ox1pTjwNVWrBs60tUETP8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a44jh5qG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a44jh5qG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043191F000E9;
	Tue, 28 Jul 2026 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785249654;
	bh=8nFE7ElBXlbOdVWwIBeNyvfZnpknUDTM2BKLJqBrg7I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=a44jh5qGUNbtPBrRqLZO+VWxAP2oSzSeTOPvkV8txbI1j6DcctbYvcI6/G7cNycfj
	 O7y7tw9nPqzcoX+oqg6jGJb7Vw2iV9pDheiICAtH1f/sWTtet/7p181F+iDHe8a71D
	 er2yAswnU3X3VoVMHJdgS/6xC0XvS4S8edIV6l/bWOR2oEQVM1HqE5qTBhszJlMgDC
	 eIzK+oC0bZNR1WdTa99wxbZlitYWsIqetl/tcjE348gx3kKtjD4b4oVf34ctOPyxLI
	 pvnrRuhwphGSUHVwYEga/kjDT+YmS29+qtbk3NEE7w63rTeQTZg0XR9nT7cL9R9vo2
	 KxUs1y6JzH7tQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Justin Suess <utilityemal77@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
Subject: Re: [PATCH v4 0/4] media: rc: sunxi-cir: support the
 A523/H728/T527 IR receiver
Message-Id: <178524965176.668575.6519599473909041005.b4-ty@kernel.org>
Date: Tue, 28 Jul 2026 22:40:51 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 27 Jul 2026 22:49:12 -0400, Justin Suess wrote:
> This series adds support for the CIR receiver on the Allwinner
> A523/T527/H728 family (sun55i).
> 
> Apologies for the hasty v3 respin.
> 
> Tested again on my X96Q Pro+ (H728) TV box with the Google TV remote that
> came in the box (using NEC keymap). Was able to press buttons and
> get readings from lirc / ir-keytable again.
> 
> [...]

Applied to sunxi/dt-for-7.3 in sunxi, thanks!

[1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
      https://git.kernel.org/sunxi/linux/c/96cd41eac1f5
[2/4] arm64: dts: allwinner: a523: add IR receiver nodes
      https://git.kernel.org/sunxi/linux/c/2b24f5386528
[3/4] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
      https://git.kernel.org/sunxi/linux/c/a3bd47e62cb2
[4/4] arm64: dts: allwinner: a523: enable IR on the Avaota A1
      https://git.kernel.org/sunxi/linux/c/75dc83d420aa

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

