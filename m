Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE36625EF87
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Apr 2026 21:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776633718; cv=none; b=uyyResY/2kgmhtGBkzj2dX6R2J/4O1RfE3vom3GLFV2WhhsQiR2ihUBHpkNEv9wIVMOxES8V9QG7jci05a/T7YMqs2O/DXYngXrSWx9pq5qS3F0XKeTbEr5SimxDnf+KolX/ZzrkR8QIdJklvVL9xRSq40FOTskzinwEvW8U954=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776633718; c=relaxed/simple;
	bh=KPDKCHePwqXGiufNS/KL+heUjt/2gtc+Vw6iiDD5x5U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qx9IM3dixtWHBk66KzGF40vdE9KASIMyuikw49slHeYXG88j7mlL1MP40devHPylKDzGEw33IQKlu5YZ7dxdM+hqXW4nkFSajNkXYW72Psffw8nFgp6UxqSwYFEe8nOSz3AiPiszBjTICaBIvI0L8svyeUPPsNl11A0DZIzWQXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Svdigpoj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Svdigpoj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DD6C1596;
	Sun, 19 Apr 2026 14:21:49 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D9883F7B4;
	Sun, 19 Apr 2026 14:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776633715; bh=KPDKCHePwqXGiufNS/KL+heUjt/2gtc+Vw6iiDD5x5U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Svdigpoj90VsDGdlirxxFGIzJMo1HY+I6n8tz/RQ8JbZ0L/bOWIOPlor9KPwlEmht
	 mWQffKc7qNhaCrrNJfrVSZsE8ql2pJ8BbcCuYMf+1Ef7Dr3EZRQW/HoxsUDPyG0vuB
	 TEwdGaSnsbEcv3+SYz70jzPKXS2REMSW2hpEX1ss=
Date: Sun, 19 Apr 2026 23:21:27 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/4] dt-bindings: timer: allwinner,sun5i-a13-hstimer:
 add H616 and T113-S3
Message-ID: <20260419232127.39e5f43a@ryzen.lan>
In-Reply-To: <20260419-h616-t113s-hstimer-v1-1-1af74ebef7c5@mmpsystems.pl>
References: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
	<20260419-h616-t113s-hstimer-v1-1-1af74ebef7c5@mmpsystems.pl>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 19 Apr 2026 14:46:07 +0200
Michal Piekos <michal.piekos@mmpsystems.pl> wrote:

> H616 is compatible with the existing sun5i binding, but
> require its own compatible string to differentiate register offsets.

Just a nit: if the register offsets are different, then it's not
compatible, not even with the binding. So just say something like "they
are similar, but with different register offsets".

> T113-S3 uses same offsets as H616.

So it looks like (somewhat naturally) this is true for D1 as well? And
since that SoC was the first, we use "sun20i-d1" as the compatible
string prefix for this SoC's devices. I think we should follow suit
here and name that similarly.

> 
> Add allwinner,sun50i-h616-hstimer
> Add allwinner,sun8i-t113s-hstimer with fallback to
> allwinner,sun50i-h616-hstimer
> Extend schema condition for interrupts to cover H616 compatible variant.
> 
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  .../devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml    | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
> index f1853daec2f9..bb60a85dc34b 100644
> --- a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
> +++ b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
> @@ -15,9 +15,13 @@ properties:
>      oneOf:
>        - const: allwinner,sun5i-a13-hstimer
>        - const: allwinner,sun7i-a20-hstimer
> +      - const: allwinner,sun50i-h616-hstimer
>        - items:
>            - const: allwinner,sun6i-a31-hstimer
>            - const: allwinner,sun7i-a20-hstimer
> +      - items:
> +          - const: allwinner,sun8i-t113s-hstimer
> +          - const: allwinner,sun50i-h616-hstimer
>  
>    reg:
>      maxItems: 1
> @@ -45,7 +49,9 @@ required:
>  if:
>    properties:
>      compatible:
> -      const: allwinner,sun5i-a13-hstimer
> +      enum:
> +        - allwinner,sun5i-a13-hstimer
> +        - allwinner,sun50i-h616-hstimer

IIUC this just matches the H616, but wouldn't match the T113/D1? And
there is some construct with "contains" to match for fallback
compatibles?

Cheers,
Andre
>  
>  then:
>    properties:
> 

