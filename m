Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30813C4563;
	Fri, 15 May 2026 02:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778813115; cv=none; b=XFSLwczQckWU3z3cqVU/CFUmsACGT5Wo0H3bTs4NjH3Q4n03we71iRIYjgIxsCJZZf0HX9Fdgxwj5wVYS1aLJe1LDs1YauIMX+cz6CztdOVuHDkheeM+95Z58/1KFqio3D+WWNoTQpF+dHHqyw3G7pK1DPnhqnZ6IGfvy1pnUhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778813115; c=relaxed/simple;
	bh=CAei6OyLs4Wh4ZQBWKlQtYH2e5Z/B4QH1dkxlz+9PUg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n3nanZsbnI99pR7ig2dwPGyOLGszMLF3q3IUkM5RYDvOST/eGsUkPGPimFTzJUOsaj3fa9Z/P1ehx6lC5+zC+mivOXxVFYyiLbDDc4WH0Pl1KVjr5u43brxu9I4zLLTJ+NUylwk4hUSWapDc9CXakloAMt0ptsewQUCV+9N5xus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRlSO5xW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRlSO5xW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C13C2BCC9;
	Fri, 15 May 2026 02:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778813115;
	bh=CAei6OyLs4Wh4ZQBWKlQtYH2e5Z/B4QH1dkxlz+9PUg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=TRlSO5xWcbYmlEcPCUHsV4Jeg6XGaio3XVs+9VyC/2rtYgAyKS3tt4SE8Lg4fyL9m
	 rwyb+JQ5b4pzCvRsNNP55O3SvvUlR61C1ry2W5aYC170gH0oR1XWcii7e2eApMZ7sY
	 enUkxz2o3dJX4tfOvgc8xGRWx1MMSAZAvzhcjeUzg0LLzXAz2QqK0j1rJTmwBmeyOx
	 A9/RA2vXSTTU84NUIujjFLiOUgRat+oFriPkgIq1fhFy9mXM1hqPP6nNdxCW2TPaVW
	 cHYpUZ5sO0WKBKNSacKGFUtjwrZ586y2DZehrAZjtFGjLXZCgxu+T0iXBEFs+3Z7nY
	 DW0rbBUPOO85g==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Chen-Yu Tsai <wens@kernel.org>, 
 Andrey Skvortsov <andrej.skvortzov@gmail.com>
In-Reply-To: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
References: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
Subject: Re: [PATCH] bus: sunxi-rsb: Always check register address validity
Message-Id: <177881311362.121816.11798899480694318999.b4-ty@kernel.org>
Date: Fri, 15 May 2026 10:45:13 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 01 Mar 2026 17:49:39 +0300, Andrey Skvortsov wrote:
> The register address was already validated for read operations in
> regmap_sunxi_rsb_reg_read before being truncated to a u8. Write operations
> have the same set of possible addresses, and the address is being truncated
> from u32 to u8 here as well, so the same check is needed.
> 
> 

Applied to sunxi/fixes-for-7.1 in local tree, thanks!

[1/1] bus: sunxi-rsb: Always check register address validity
      commit: 322f01103323199cdd9eff8cb6aacbf1248ce36e

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

