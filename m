Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3F1424668;
	Mon,  6 Jul 2026 16:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356718; cv=none; b=KIE82bcwS5+vh/s7rwM8EWWtSbpW8Gg0hNcqSfXf9IguBfJb+CxuWc0hqZegnBE9HTZ9D5CHOI2d6mbbwEjmPIMrAutudyWwQ02f0xsGtAlHSCLUfOvNU4N1xK8YoO1swp+5Vl2x6Sei40VdV29Tm8iEwM2Osi6Ptg+NrD2P1bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356718; c=relaxed/simple;
	bh=9ddNOu1jB+wf1AVPUmj7NR0ecwDXYHP4itHv2YHqwWY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gne8Edt1LizssdsJ29+qODpYQMgfgkj6yr5Y6aDK/pvhEAWO++7skT1YsZ2Q4t/JC2BO/3s8tPNj+XisuvUo/x//2tarIRXwRbsbsUmyyIUIbkvPnz/CJQ6GBR42Nb386j4FN6MMaywWwBQEUGcDeM9Pc/9b1bos8lffL+aAGrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDXU7toP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDXU7toP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BB81F000E9;
	Mon,  6 Jul 2026 16:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783356716;
	bh=o7fFB3vRviS+SAq8MySgtijtTpItKoaFOog02r7EO7A=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=dDXU7toPgKIuALtUfdJzUkg/X3+XXOCKb8BmFZIGaf9SExJ3O5MX87fW2cIKMu7JG
	 19iQqLA65DYi+8wtkbRoWjW9YifvpZ4ZGA1riUGFVhGWRaEkBh84i7XhX2DWXtI99u
	 Ea2ycWGpc1M7vpfSEAXfI2UuRi6jQMkmhqda+0iYBUBwCu9S4XSDvuynQ+erx4cYb6
	 E98vP9owXf7td7SyRNtLaaNPOWFAgC3rkhn72QPQoz/O7sjSaocAJnMl2FG+nUiOYp
	 SCsO/Lv+IvobC33YyMuvjIi+z9igAK7mGgxpmsM6u0zSorotNAL169vmjaUA5KrlBB
	 c6x8Yk993s/PA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101951.341727-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101951.341727-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: allwinner: sun8i-h3: Correct indentation
Message-Id: <178335671460.3965045.10345566187999207328.b4-ty@kernel.org>
Date: Tue, 07 Jul 2026 00:51:54 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 06 Jul 2026 12:19:52 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> 

Applied to sunxi/dt-for-7.3 in sunxi, thanks!

[1/1] ARM: dts: allwinner: sun8i-h3: Correct indentation
      https://git.kernel.org/sunxi/linux/c/5ede58393a70

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

