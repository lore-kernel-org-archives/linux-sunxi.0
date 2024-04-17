Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FD113FD63
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Apr 2024 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713362341; cv=none; b=ggS2t2Ssp44mmsjgau03Vd//FRLu11LYrJxp0wvB3Valft7A2MI0v1bERlylR25kaBrGY3nV+Y5T7++H2UnMxPR/PxzksF7ERJ8ie9RoIS81jdSpFtwUzBWJZr7hI6RudxLstPMTqwfFjnS532dkaQ2YQvqgFlSXmKgi0HrrYXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713362341; c=relaxed/simple;
	bh=LWkTk7CJZ298OX2BHh1YwAZQVrBGrq8/jaBno+Mjxr8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Umpn5kbGhq32SCO8dLqYpXNjOcj9EYcErnODFes7RuOcmqjJye2CGswuoohwSvly2LY2OmTy3ljRodGAZmyeSaMWe1lfN5uvLkVcn99YqQiKO01QBI54aNwsds7G8k6iUEstSdgkhFZ7TjagimDFslZXLbN8z26iif0P9tahuSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE1C6339;
	Wed, 17 Apr 2024 06:59:26 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BCBE3F738;
	Wed, 17 Apr 2024 06:58:57 -0700 (PDT)
Date: Wed, 17 Apr 2024 14:58:54 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ryan Walklin <ryan@testtoast.com>, Chen-Yu Tsai <wens@csie.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Chris Morgan <macromorgan@hotmail.com>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/4] dt-bindings: arm: sunxi: document Anbernic RG35XX
 handheld gaming device variants
Message-ID: <20240417145854.46827456@donnerap.manchester.arm.com>
In-Reply-To: <ec2be6d0-68ea-41b5-a12c-5f926c7a8f81@linaro.org>
References: <20240414083347.131724-2-ryan@testtoast.com>
	<20240414083347.131724-3-ryan@testtoast.com>
	<78b5de01-150e-4537-b6a6-8ca0067a8359@linaro.org>
	<f0b5aea5-54f6-4c3b-9c16-f7e97c58ea6d@app.fastmail.com>
	<ec2be6d0-68ea-41b5-a12c-5f926c7a8f81@linaro.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Apr 2024 15:33:13 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

Hi,

> On 17/04/2024 11:05, Ryan Walklin wrote:
> > Thanks for the review and feedback.
> >   
> >> Any reason these are not just one enum with three entires?  
> > 
> > No, this is just to match the existing devices, are you able to point to an example elsewhere?
> >   
> 
> Even for variants of same boards?
> 
> The examples are everywhere, e.g. Qualcomm or NXP.

We have separate entries for closely related boards (Pine64 H64 model A
and B), and also indeed for updated variants (the various PinePhone
revisions).
That doesn't need the stay this way, of course. We would lose a quite
natural way of putting a descriptive name to each compatible string (cf.
"Pine64 PinePhone Developer Batch (1.0)"), but if the main purpose of this
file is to *reserve* the compatible strings, it would indeed be shorter to
use enums for related boards.
Don't know if this would a real advantage, though.

Cheers,
Andre
