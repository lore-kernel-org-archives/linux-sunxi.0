Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BF23EDAB9;
	Fri,  8 May 2026 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778249785; cv=none; b=GwimzlW9kWVY7R/wpeI3kkayI7rw9mMU2LK2OAidyHN+7v99rHdYsWPU/IIho5uUDfLhK80g1uaaRzH+DGEMK7Rlr6cTip7+6VFd3Xe7uMpvwlKy9QsOKEkJktDKkSWEQKs4P3AT79KgbcR5dg0pfZdqU8/Z18poqq7NcZO+ai8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778249785; c=relaxed/simple;
	bh=dtZoaePTk4X8dipva16HFTgNbUNAXrez3GknSW8itDc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JOHtNqZ6g2ZTtDK8g6NTVb+0hm+nklZXYEf5Gsai/7Ji2tSb9yGub6QrhqVAt7/b9uY01SZxzI75oMRl91k2/eNtpqwmSlx0MrsFLF944/BV5rCT1Wnd1KT36F9wJpYtizFJesqFd2GYpZk4lFi6YHSPjvApsn5VQW9gFOguJog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1ZtSnRS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1ZtSnRS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82131C2BCB8;
	Fri,  8 May 2026 14:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778249785;
	bh=dtZoaePTk4X8dipva16HFTgNbUNAXrez3GknSW8itDc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f1ZtSnRSiowqAE+O3E8ZQp9fJPzaFZmF4OqdodHXnftciKYF1E0THQh6GFuBaYG1q
	 QROrVfJ7DVcWm5HCz9kRH4mf7pt9APcAYdH4rWfheCggjzokmo5OAlLF+itx4oTFjy
	 bpPTQysVN12SmSbpNbtM4Y5zYQgxzxlXt9qJ+nABjOPDtQK1yH3e/stG6YgYC3dMSm
	 GTOVsLDmhwmUJr70a67F4UMZsn8PGPm6ET7Li12/Z94F46jfWCtTh8+k2yWPPcpwVV
	 o46Z3BtuTSFgzfEXXK2SxakbrwJHGrLGwQV6iWWivxAqWdTTnq4Q+AM/+q0v2tGmAh
	 azRLc1gg+H8iw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260506-t113-mangopi-reboot-hang-v3-1-fa15a360a520@mmpsystems.pl>
References: <20260506-t113-mangopi-reboot-hang-v3-1-fa15a360a520@mmpsystems.pl>
Subject: Re: [PATCH v3] arm: dts: allwinner: t113s: enable watchdog for
 reboot
Message-Id: <177824978321.59995.2431541196860204454.b4-ty@kernel.org>
Date: Fri, 08 May 2026 22:16:23 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 06 May 2026 12:14:31 +0200, Michal Piekos wrote:
> Reboot hangs on T113s boards because no restart handler is
> available.
> 
> Enable the SoC watchdog whose driver registers a restart handler.
> 
> Tested on LCPI-PC-T113/F113.
> 
> [...]

Applied to sunxi/dt-for-7.2 in local tree, thanks!

[1/1] arm: dts: allwinner: t113s: enable watchdog for reboot
      commit: c6895beaf5eab889ebdaffeb6210ad1111f3e72e

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

