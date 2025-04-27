Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C118622FF22;
	Sun, 27 Apr 2025 05:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745732893; cv=none; b=h4/5fr4K6jIyN5y3QdfWo3xDVDaRvMPZU1b9LC6R17Uafqfk8m+FEiXn8LjJDYJRaEbLcoDu+T36Qh3UU1wSVne9nV2H/LAHe4ft1sC3DoH/lS5J0A53m52if2gMa2O447uoON57izqFFco0hHEfM6+X05EpO9TARkG1MwJHdE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745732893; c=relaxed/simple;
	bh=653wrFkBsEztDayeuBWGq/zrOUm09EJX5lzRDPy7HVg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZZ06iyGwhE0BMqx4Ra0ZPshGoxFxNUEDdeYSX36h4iHb/Au9kUDsRtLqyA61rP3yzv2dTu1J7wAvVG+OwloZyMfmrw34CLwFkRqLdp9EuDvIEvfFq36KqKSkQQQ36xsbBYGjwdIqUXWB0EEn/YYb8u9Hfkke9HKW5lJY6yBUb58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00EAC4CEE3;
	Sun, 27 Apr 2025 05:48:12 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 81FCF5FA0F;
	Sun, 27 Apr 2025 13:48:10 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Dragan Simic <dsimic@manjaro.org>, Peter Robinson <pbrobinson@gmail.com>
In-Reply-To: <20250420094823.954073-1-pbrobinson@gmail.com>
References: <20250420094823.954073-1-pbrobinson@gmail.com>
Subject: Re: [PATCH v4 0/2] Add support for WiFi/BT header on Pine64 A64
 devices
Message-Id: <174573289050.925869.16225701473400266329.b4-ty@csie.org>
Date: Sun, 27 Apr 2025 13:48:10 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 20 Apr 2025 10:48:03 +0100, Peter Robinson wrote:
> Add the BT and WiFi pins on the WiFi/BT header on the Pine64/SOPINE boards.
> 
> Changes in v4:
> - Remove the pwrseq section
> - Tweak the device descriptions in the commit
> 
> Changes in v3:
> - Explicitly disable mmc WiFi section in DT even though it's already
>   disabled in the SoC DT.
> 
> [...]

Applied to dt-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/2] arm64: dts: allwinner: a64: Add WiFi/BT header on PINE A64
      commit: 91fe4b2e69419d5477c7776cf38df1970ad162d2
[2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SOPINE Baseboard
      commit: d3f6af8473a06f66078dc7833c8eac25c8d2b929

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

