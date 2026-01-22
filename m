Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676A63191DF;
	Thu, 22 Jan 2026 17:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769103322; cv=none; b=reDRqPcGllUmOKb+32HtgMIRLCl5HPXMNaRpzjg4BwRbGoZtpYDMGK9sEOj95bnLdXdMbd84f8xPXLdONj6mxWK48sW+l5yaNL/HxzEzRoleHuTcFuA2bOFmuf6aVvrfh4Xq0P5lcXmUs9GSSeZDZReaEoaIPY2IQKDLqEY5xHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769103322; c=relaxed/simple;
	bh=x6oKsK4tsX/k/NIRjfg4qq6ZO9RvracVhuSMqKYde28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I0Nefqsh6MxFV4lWBZZf1eSRuIYJXNsX15Dp8kDL3vPVFciM7xOe47dMjitbM3t1XJbPjXSaJQvkB0h3DO4/Oz52tkKO9bHTC2uRCDJmaGkV1DQ9zaZbbLwltooDVzj/LxuP28CcJ731ofYxaqkgdErgEexQ6q9JPyQW5qT1fK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3OkG3p6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3OkG3p6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0567C116C6;
	Thu, 22 Jan 2026 17:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769103321;
	bh=x6oKsK4tsX/k/NIRjfg4qq6ZO9RvracVhuSMqKYde28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s3OkG3p6323vXxuW6xvJKOwIrhDIiIBPZvL0xeeA8lCOSRG/MZTUcXBPs1vU4rY8R
	 i6aze9u6G+sP6l8FCIlUSk+CtSLn51D4Owe8rVvxQAUj23VJ2S+QYeJMUE8s0glO99
	 sC0EZ46oTtYI6sFAL5yS7SZkppWMyS100iuTtoSStV0D1OcvZwdBCaP9WtW/5nHUbi
	 eVMZW7yhpXQ05l1Xw3guwvKRoO3tl+3dsBOk9iY7M6eI2+sCtBux3N7kav6/CQqnat
	 ijjGNalKxRSUJD13nlTPgxpsN7g+2AclyiZXwCCzGfNJ0UmhptC9WUrleR5qFGawhU
	 amnF3EVxVxkkg==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 05AAB5FBF7;
	Fri, 23 Jan 2026 01:35:17 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Lukas Schmid <lukas.schmid@netcube.li>
Cc: linux-sunxi@lists.linux.dev, Alex Studer <alex@studer.dev>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
In-Reply-To: <20260113182951.1059690-1-lukas.schmid@netcube.li>
References: <20260113182951.1059690-1-lukas.schmid@netcube.li>
Subject: Re: [PATCH v2] riscv: dts: allwinner: d1: Add CPU thermal sensor
 and zone
Message-Id: <176910331795.3372333.1441179153534465132.b4-ty@kernel.org>
Date: Fri, 23 Jan 2026 01:35:17 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Tue, 13 Jan 2026 19:29:48 +0100, Lukas Schmid wrote:
> The sun20i THS (built in CPU thermal sensor) is supported in code, but
> was never added to the device tree. So, add it to the device tree,
> along with a thermal zone for the CPU.
> 
> Signed-off-by: Alex Studer <alex@studer.dev>
> 
> Changes since v1:
>  - Move include before defines in sun20i-d1s.dtsi
>  - Fix register size for thermal-sensor@2009400
>  - Move thermal-sensor@2009400 in SoC to match register address sorting
>  - Add thermal-zone for sun8i-t113s.dtsi and fix missing cooling-cells
> 
> [...]

Applied to sunxi/dt-for-6.20 in local tree, thanks!

[1/1] riscv: dts: allwinner: d1: Add CPU thermal sensor and zone
      commit: f36e738549d483878ebf4cc9826c46d9dc4aa496

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

