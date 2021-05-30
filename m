Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11643173
	for <linux-sunxi@lists.linux.dev>; Sun, 30 May 2021 00:30:19 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id lx17-20020a17090b4b11b029015f3b32b8dbso6656993pjb.0
        for <linux-sunxi@lists.linux.dev>; Sat, 29 May 2021 17:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=Xq8rjDdajOrEnJH/gYsPZPip8sU4KPaYjYp9VZxKFxg=;
        b=Li711QZ4jfbmgsYIYc13IzJADdEzcf/jVUy5AIHJgsr00pEXHYXwBh5HE5xuHgQ9Iw
         OuF0OawaFzTp+DkAbEwoSZxEuLtKvFH6VYDWrvzvdp6Uc1L5x+x994srisje+kTR4Qmf
         ZExtumx+PUJg+rAkp6HwcVDgEyHlZzF9QKIolJ8rfLLazk3Yj8xfWPetx+6O+kTUkfvN
         UVxnkBQG52r++fcHdKP9Lma7hwtC41ipDo9Ll72XXjn+dIaEvQbv66QXaMqKeMvrMa3i
         eA976sfPV9IRtUaNQoRkp3jIev3kFelLcnuJk9khpW+A5oiHDsQFY1mJ9OZuX8A1spfz
         OFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=Xq8rjDdajOrEnJH/gYsPZPip8sU4KPaYjYp9VZxKFxg=;
        b=H1mqmFvhHX4ETRAO6xr+zVhvyryod9DonifL2Kpl0UckadGocJvcm4R1XtIxP8Z4n1
         VxF8yDIr4feHzBs9NjsmiZeEcd521xEA61MQfuxptT3zlPvNfSnRbpKFBebVN389kfg8
         gXcnqD9QVLu+ICtfeXj/J+fdj2bBLrL+OKhql2wugE7RJ8UEmMeorbcZAvLxP/NOT57q
         vrvPusaC/qZuvxzqvG0mqHNIDDxTFCGY0h5ojqgASRIg3BmKd7qms1D4pD0HHRlseVRr
         rL96GikSvH+kNr1jevN/OXPOmQLIHJCgyS7OI4tGH5BvhvW1xbQs748pyis4x+mip1tM
         08FA==
X-Gm-Message-State: AOAM530qszoDQL0PRdM9zu5cLIvXL9bCxPqDCVZPJpjbxck1+7iWRRy1
	hH5OVYO/LyCDKL79tQbCnEi6Kw==
X-Google-Smtp-Source: ABdhPJxKeHz3bdKzW+qaaA5CNw7eizOlyQUSlrZom5qN9xyOtG7sUWzn4T85FVINWEK0dsYvqxAOZQ==
X-Received: by 2002:a17:90a:6589:: with SMTP id k9mr3348112pjj.14.1622334619298;
        Sat, 29 May 2021 17:30:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id a9sm7182418pfo.69.2021.05.29.17.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 17:30:18 -0700 (PDT)
Date: Sat, 29 May 2021 17:30:18 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 17:29:11 PDT (-0700)
Subject:     Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
In-Reply-To: <CAJF2gTTBAKTBY5AF9jd8tfT-33Y+McyFis_xk_aMvZZpLsvVxw@mail.gmail.com>
CC: anup@brainfault.org, drew@beagleboard.org, Christoph Hellwig <hch@lst.de>,
  Anup Patel <Anup.Patel@wdc.com>, wefu@redhat.com, lazyparser@gmail.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
  guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-a5f8374f-350b-4c13-86e8-c6aa5e697454@palmerdabbelt-glaptop>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 21 May 2021 17:36:08 PDT (-0700), guoren@kernel.org wrote:
> On Wed, May 19, 2021 at 3:15 PM Anup Patel <anup@brainfault.org> wrote:
>>
>> On Wed, May 19, 2021 at 12:24 PM Drew Fustini <drew@beagleboard.org> wrote:
>> >
>> > On Wed, May 19, 2021 at 08:06:17AM +0200, Christoph Hellwig wrote:
>> > > On Wed, May 19, 2021 at 02:05:00PM +0800, Guo Ren wrote:
>> > > > Since the existing RISC-V ISA cannot solve this problem, it is better
>> > > > to provide some configuration for the SOC vendor to customize.
>> > >
>> > > We've been talking about this problem for close to five years.  So no,
>> > > if you don't manage to get the feature into the ISA it can't be
>> > > supported.
>> >
>> > Isn't it a good goal for Linux to support the capabilities present in
>> > the SoC that a currently being fab'd?
>> >
>> > I believe the CMO group only started last year [1] so the RV64GC SoCs
>> > that are going into mass production this year would not have had the
>> > opporuntiy of utilizing any RISC-V ISA extension for handling cache
>> > management.
>>
>> The current Linux RISC-V policy is to only accept patches for frozen or
>> ratified ISA specs.
>> (Refer, Documentation/riscv/patch-acceptance.rst)
>>
>> This means even if emulate CMO instructions in OpenSBI, the Linux
>> patches won't be taken by Palmer because CMO specification is
>> still in draft stage.
> Before CMO specification release, could we use a sbi_ecall to solve
> the current problem? This is not against the specification, when CMO
> is ready we could let users choose to use the new CMO in Linux.
>
> From a tech view, CMO trap emulation is the same as sbi_ecall.
>
>>
>> Also, we all know how much time it takes for RISCV international
>> to freeze some spec. Judging by that we are looking at another
>> 3-4 years at minimum.

Sorry for being slow here, this thread got buried.

I've been trying to work with a handful of folks at the RISC-V 
foundation to try and get a subset of the various in-development 
specifications (some simple CMOs, something about non-caching in the 
page tables, and some way to prevent speculative accesse from generating 
coherence traffic that will break non-coherent systems).  I'm not sure 
we can get this together quickly, but I'd prefer to at least try before 
we jump to taking vendor-specificed behavior here.  It's obviously an 
up-hill battle to try and get specifications through the process and I'm 
certainly not going to promise it will work, but I'm hoping that the 
impending need to avoid forking the ISA will be sufficient to get people 
behind producing some specifications in a timely fashion.

I wasn't aware than this chip had non-coherent devices until I saw this 
thread, so we'd been mostly focused on the Beagle V chip.  That was in a 
sense an easier problem because the SiFive IP in it was never designed 
to have non-coherent devices so we'd have to make anything work via a 
series of slow workarounds, which would make emulating the eventually 
standardized behavior reasonable in terms of performance (ie, everything 
would be super slow so who really cares).

I don't think relying on some sort of SBI call for the CMOs whould be 
such a performance hit that it would prevent these systems from being 
viable, but assuming you have reasonable performance on your non-cached 
accesses then that's probably not going to be viable to trap and 
emulate.  At that point it really just becomes silly to pretend that 
we're still making things work by emulating the eventually ratified 
behavior, as anyone who actually tries to use this thing to do IO would 
need out of tree patches.  I'm not sure exactly what the plan is for the 
page table bits in the specification right now, but if you can give me a 
pointer to some documentation then I'm happy to try and push for 
something compatible.

If we can't make the process work at the foundation then I'd be strongly 
in favor of just biting the bullet and starting to take vendor-specific 
code that's been implemented in hardware and is necessarry to make 
things work acceptably.  That's obviously a sub-optimal solution as 
it'll lead to a bunch of ISA fragmentation, but at least we'll be able 
to keep the software stack together.

Can you tell us when these will be in the hands of users?  That's pretty 
important here, as I don't want to be blocking real users from having 
their hardware work.  IIRC there were some plans to distribute early 
boards, but it looks like the foundation got involved and I guess I lost 
the thread at that point.

Sorry this is all such a headache, but hopefully we can get things 
sorted out.

>>
>> Regards,
>> Anup
