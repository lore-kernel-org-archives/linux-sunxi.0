Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AAF4E77F7
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Oct 2026 16:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563378; cv=none; b=sqY12LvZoQrRGBKZYWTVqgJQH4FplLoPBslJIN6677OWbsxUAVXR33pv9PUfygG+5lKe4KTSZiUOf9lJnIxcG+TtTa3n3K0H2TBwMA4ZGxbOOqVzRebc6WnA2qkMBwfcq55Vt/9XGEk43tVvBjcQMwAeDZUlNXc+Gnjb6QDQjkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563378; c=relaxed/simple;
	bh=9AeOqZjWordDbYuRRz6/pidGv19rdPH4O4n+5klwf3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZS/C0/v59X5XdMejlV9WOFE0XtkAyMCKa15tWTlVI+eMUDzyWcuZNjgAQB5/20ABp9t+gJfwfuilaOzZJR6pINDVXwNXVTuhsGRRnf6HgWSe0ou+PbdxmMTkoeiRkZJ1xo7VZasRz4yjPyHIvBGlqu3LsQgDEgz7SoTDMER1GcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=u7MVC0Gb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="u7MVC0Gb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 047611D14;
	Fri,  9 Oct 2026 09:29:33 -0700 (PDT)
Received: from [10.57.55.139] (unknown [10.57.55.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E64633F66F;
	Fri,  9 Oct 2026 09:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791563376; bh=9AeOqZjWordDbYuRRz6/pidGv19rdPH4O4n+5klwf3Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u7MVC0GbyHZZ4tpzIsPxg90qw4hlr73oIllXMEXhD38Qi3sgnjheE4HOH2WPtUuVk
	 44vRvI7DrL0W0o6k0N9hEbYuDWDJeebVjltI4b0uGX38/0bqKqyZrJW8ftKJzj4Ary
	 8A9neW5eJg/3j0hfTWWF/CjqmkTpZCmZ2sXjM4Bc=
Message-ID: <46b973a1-3c3c-4321-80fa-a929375d52bf@arm.com>
Date: Fri, 9 Oct 2026 18:29:33 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] sunxi: Add support for A733 SoC
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Yixun Lan <dlan@gentoo.org>
Cc: u-boot@lists.u-boot-project.org, linux-sunxi@lists.linux.dev,
 Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Kocialkowski <contact@paulk.fr>, Samuel Holland <samuel@sholland.org>
References: <20260113-01-a733-soc-support-v3-0-f19dcd098f60@gentoo.org>
 <20261009120356.194364-1-vinicius.eduardo.pedrosa@gmail.com>
 <3f57db40-a604-4800-b15f-2d159a3a5ca7@arm.com>
 <20261009161409.256732-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261009161409.256732-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vinicius,

On 10/9/26 18:14, Vinicius Pedrosa wrote:
> Hi Andre,
> 
> Sorry about the wording. I kept repeating it to give context to people
> who might be reading the thread for the first time, but I see how it
> came across. I'm building on Yixun's work and yours, and I should have
> made that clearer.

no worries, I got you ;-)

>> Honest question, is it really *you*, or is it some LLM?
> 
> Yes, it's really me. I've been working with embedded systems for many
> years, but I'm new to public contributions, as you've probably noticed.
> I do use AI to help me research tools, handle some tedious tasks, and
> improve my English when writing emails. English isn't my native
> language, and I sometimes rely on it too much for the wording.

It's not the first language for most of the sunxi folks either 
(including me). Just try your best, we are used to decipher slightly 
broken English on a regular base. If you really must, feel free to let 
AI help you with the wording, but try to not let it wash down your style 
too much, or make it too perfect. Translating incoming emails into 
Portuguese(?) is fine, of course.
But maybe *you* learn a bit or two by doing it yourself ...

> But the
> hardware work is real, and I take responsibility for what I send.

Cool, that's good. I already figured as much, just wanted to double check.

>> Why not? Probing DRAM is somewhat the idea of that routine, and it
>> should restore the previous values it overwrote? So have you tried
>> running that?
> 
> I haven't. I was concerned about overlapping BL31, but I should have
> looked more carefully at how the routine works before ruling it out.
> I'll check the probe range and try it.

It's not the nicest test in the world, and it stomping over BL31 is 
sketchy at best, and just works because we don't really protect BL31 if 
it lives in DRAM. If we would (and we should!) it might actually trigger 
an EL3 exception, so the routine really should observe reserved memory. 
Also I am not sure what exactly happens when it goes beyond the 
installed size, I guess that differs by system.
BUT: it might just work, and then it's good enough for that time where 
we rely on boot0 for DRAM init.

Cheers,
Andre

> Understood that the FEL workaround is temporary, so I'll drop the size
> header idea. If it's useful, I can test your U-Boot proper series on the
> A7Z when you post it.
> 
> Thanks for your time and guidance.
> 
> Vinicius

