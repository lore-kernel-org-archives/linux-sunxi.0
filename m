Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074F413B7AE;
	Sun, 24 May 2026 17:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779644036; cv=none; b=VJXBSh2+V0zKrgrBnHftveRN/Ug/GL2ygAscTjyw0JKviSgBVt4UKkfl8/LhSpetH33dDYkPMjrC1dRTmZiSQALtTrTRFoURCEZCcU3VhHWnmOxfKLHAzTUztsEOyw2lnITFm4c2T6pGV7GhFeL3HqRsNVsOS+BTMj6kBcktJUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779644036; c=relaxed/simple;
	bh=qOzmpszDdWGhsNPfTyjWbHJf3llQic0SfMmq7eaa2nk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TWGHh9VNvEgaCQe6VgZJ1lwBrD10OcWwng+Y6IjvcIpgfw3r5a1yqW1csQFOYfLMl39q4A3SERogHKSYHXXQLmp3dYKgQa75yTfxoVEoEGEI6ipOYOTIwLjAvTkUgvRzjlzXQAK8RtN9odPDberzZGtkW4slOeqbRsiENiFLMkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpDuxRgF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpDuxRgF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F8A1F000E9;
	Sun, 24 May 2026 17:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779644035;
	bh=UgaNPISvUn6xIAYsFHLCVHpW1RByn/TtLzeqOoZCRlo=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=mpDuxRgFPqmM5H1QBSmJ8JeLGQ3WvE/QCvAGe31qS9Ez4n4E8uAr6yaXl9OEaaXu2
	 Sn6O4ABq1/Onfp148WWtOy22tPRMdMxhLbt/y8v9oPu3Z8vLnvp9JoyENGNR/WphtW
	 PFp6q3SP7kG+dH9knIITW/VdvtIk+U6SLpSsZerf4MCeJyvQ+89DhyFQH9oRZ0SU5B
	 NnrsHutEC5DJWIQ2/Z8qXDVIspMy96RAT3/uYsDaHZ5Z1r7KbztLsEln/dtCYc/quy
	 bpBpN02/ubRabllJbovCo9WNBmHlJEwGTvlwkrHbnZkxbfvA4RcwUv8Y08MdAwrWpS
	 UbyN8seWrtyTg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Peter Robinson <pbrobinson@gmail.com>
In-Reply-To: <20260518220455.156874-1-pbrobinson@gmail.com>
References: <20260518220455.156874-1-pbrobinson@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: sun50i-a64: Enable DT overlays
Message-Id: <177964403378.111316.1064963381424258232.b4-ty@kernel.org>
Date: Mon, 25 May 2026 01:33:53 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 18 May 2026 23:04:49 +0100, Peter Robinson wrote:
> Enable DT overlays on some of the Pine64 devices to enable
> use of addon accessories such as WiFi or audio modules.
> 
> 

Applied to sunxi/dt-for-7.2 in local tree, thanks!

[1/1] arm64: dts: allwinner: sun50i-a64: Enable DT overlays
      commit: 3a6ffc1b4fcecd021361393d7294badb0d89e5b0

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

