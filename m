Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0112F8E9C;
	Fri,  8 May 2026 14:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778249783; cv=none; b=qgWJ+xFe8nJn8L8Lsdwnl7lwEiv9lVSJOYunInmDuNVlSGLEUe1jUaP31LY3xZlWqyKG+KFVtCzGzbHka7AS4zgyBwamBSI5aGh7ZHHWq/yr4At92acAUaciiIKzYMkkBw1XtQ+TfnZV1RWngCIsY5jM8H478hQweGb9axgKayc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778249783; c=relaxed/simple;
	bh=0mPM2x5yjFYiozh6QP24TiAE+7o6BbL/98CcdObaOsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RHvz/7pr9maMRgrlI2Olm6EFTIlzwamHjqqierOp5b460qzRylr8YRyfCWeZp0FZxamvC/bUZobP6iEL6EQPdBOvMtrzlbOrqqObHJjiSjGK1PPp12H7/xeVWaYZcrvETQpa5rvY6PSiBbQT7Yy+m1J6OERm8GrL7xtaiuscuko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uL5EkSyB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uL5EkSyB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4531FC2BCB0;
	Fri,  8 May 2026 14:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778249783;
	bh=0mPM2x5yjFYiozh6QP24TiAE+7o6BbL/98CcdObaOsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uL5EkSyBEoLZMXFNWFH2h4PDeQC1iVaVfb48l4K6Pw+TWcnf5BTphG597YLBXsxx0
	 90KJX39EdMvIHgf66iNrnxupkrWQpKkVlYAUC+qdRL77BoXzh6kEcV5nJRUyH0MOVx
	 oEO6gUnjwojCEzqPagFywsPdPfS9YROlIMCcYE1tHgZrHOgkbQXIlr1liITnnMo6WN
	 ineRCvsa+vRdcy4lFpqLRq144y8Sw/cAUvG8g5zIaEP4kTRgZrGYMUVhu9f+GAie1s
	 t4I70GamTY+Xsuy6BGwaxPBKPqk1h7R+aO16qIGNi8bj8dW4mT1NlW0ZcMHxy1tGht
	 5yHq5iD+uPcew==
From: Chen-Yu Tsai <wens@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Andre Przywara <andre.przywara@arm.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260506-h616-t113s-hstimer-v4-0-591d425863d6@mmpsystems.pl>
References: <20260506-h616-t113s-hstimer-v4-0-591d425863d6@mmpsystems.pl>
Subject: Re: (subset) [PATCH v4 0/4] Add hstimer support for H616 and
 T113-S3
Message-Id: <177824977994.59995.8659881692173986596.b4-ty@kernel.org>
Date: Fri, 08 May 2026 22:16:19 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 06 May 2026 17:10:25 +0200, Michal Piekos wrote:
> Add support for Allwinner D1 high speed timer in sun5i hstimer driver
> and describe corresponding nodes in dts for H616 and T113-S3 SoC's.
> 
> D1 and H616 uses same model as existing driver except register shift
> compared to older variants.
> 
> Added register layout abstraction in the driver, extended the binding
> with new compatibles and wired up dts nodes for T113-S3 and H616 which
> uses D1 as fallback compatible.
> 
> [...]

Applied to sunxi/dt-for-7.2 in local tree, thanks!

[3/4] arm: dts: allwinner: d1s-t113: add hstimer node
      commit: 7c86694a7b8c9a0b2e29b312b21fcaf61d54b474
[4/4] arm64: dts: allwinner: h616: add hstimer node
      commit: fee10a33d08ae73c87a87d464f29198b6de687d0

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

