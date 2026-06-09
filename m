Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA58B25B0B3
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jun 2026 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011091; cv=none; b=fEkFWX8jIwY9ifPjLIYFMLEs3p17BUgw3lzBIca+g3q57IgU8UYS0hyYG/DNaS4WJK8ifUHEdcqOcbNsEaz2F4rcPy1ww7icJFFombh+w1F3G6hnyExYKikJFy+KSZzPiWcvJoJJF72P4JiMnEA16/eYc/oVfc3rCvF0wtaLVE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011091; c=relaxed/simple;
	bh=otRlthK/Gv83VdKjUgaYqAIKUmxRJQ0SLaBXiDnpccA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+XzkkVsno9tGqGP4ZIf37BevZKpP05e/fvWeAZJzl2QKVsnxFWTUDnKy8dhjewab7ZSyOqZ8O/4JddCp7IlGKAgiv6UrjUDolxBetQGq2P2co6OvnzPhUNZMHvPB7dkWs3ur/beYt9A9pSGCN+cwgXhRyzHB+rw24rexobWrC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mumQ40iU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mumQ40iU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C121F1F00893;
	Tue,  9 Jun 2026 13:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781011088;
	bh=u9qQyIW7o6DCu+mNhXKcjjfee6yGqblUEOyM3JGRz3Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mumQ40iUTeqjgzPAOz8A3wd/Dw9ibbr9m2wx+zodzHxsqvuEFtkuEKPSAaBA0emUC
	 mB0X5rx5KPR70GOAUlKBxryjU+/k+eXCWL/nu+nghwR3CltV/zNVnbiTqauP9Rh4CS
	 wv7pu4RVC4mLvG6owG72dWs5PW3kL+7DJItXvpdLfDcBP5Bs96DpRjLPyN8gEfcU9t
	 nmA2ubVG9DLMCbD0g92haa8nipgoSeuwiP3Yk3sOtlF/HJDYO7xGkppBSU4sbb1ddi
	 FH74Bv7S93wgY3RvCGodEPUtZde4PKfUa2nO/uYHAz0sVVj4G5sypu60R3Mqao+QWI
	 xzWb8LrCIOyLg==
Message-ID: <e2bf1f8b-677e-4184-b752-26e987f29121@kernel.org>
Date: Tue, 9 Jun 2026 15:18:02 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Allwinner DT Changes for 7.2
To: wens@kernel.org, Stephen Boyd <sboyd@kernel.org>
Cc: soc@kernel.org, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <ah3ZAPLzh8ORGmpH@home.wens.tw>
 <20260609-mighty-excellent-shoebill-04d7fa@quoll>
 <CAGb2v64guguXmg-=WYmZyz=rw3PNRvh+TnEE1yWFz=AJbryssw@mail.gmail.com>
 <98f3e864-3a9e-4f96-a633-0c0053ec35fb@kernel.org>
 <CAGb2v64o+tgnLqK_xDoauB4ThF_0979_5XPB38KiZHYyh1BnVQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAGb2v64o+tgnLqK_xDoauB4ThF_0979_5XPB38KiZHYyh1BnVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/06/2026 14:38, Chen-Yu Tsai wrote:
> On Tue, Jun 9, 2026 at 8:51 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 09/06/2026 13:48, Chen-Yu Tsai wrote:
>>> On Tue, Jun 9, 2026 at 8:43 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On Tue, Jun 02, 2026 at 03:09:52AM +0800, Chen-Yu Tsai wrote:
>>>>> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
>>>>>
>>>>>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.2
>>>>>
>>>>> for you to fetch changes up to 44cf19e41c769720750dbb8752aca75c247e565f:
>>>>>
>>>>>   arm64: dts: allwinner: a523: add gpadc node (2026-05-25 05:02:58 +0800)
>>>>>
>>>>>
>>>>> As mentioned in the tag, this pull request contains a change that should
>>>>> be shared between the soc and clk trees. However since I don't have any
>>>>> clk changes to send this cycle, I think it can just go through the soc
>>>>> tree without any issues.
>>>>
>>>> But the clock driver change cannot be in the DTS branch. This should go
>>>> via clock tree even if it is one change. And definitely not via DTS
>>>> branch.
>>>
>>> It is a shared change, because it moves two symbols from the driver's
>>> private header to the public DT binding header. I don't see how this
>>> can go through just the clk tree when one of the subsequent patches
>>> uses those new symbols.
>>>
>>> "clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public header"
>>> is needed by "ARM: dts: sun8i: v3s: Add mbus node to represent the
>>> interconnect".
>>>
>>> The other way to go about this is to use raw numbers first, then
>>> another patch in the next cycle to switch the numbers to actual
>>> macros. IMHO not worth the churn and headache.
>>
>> You can have a duplicated define.
> 
> I honestly did not know that it worked.
> 
> However, splitting what is effectively one logical change (*move*
> something) into two patches just to be able to merge them through two
> separate trees still seems wrong to me.

It is not really one logical change. Defining a new ABI (binding header
define) is considered one change. Merging binding change into driver
commit breaks rule of splitting bindings from implementation.

Second rule is that DTS branch CANNOT take driver changes. So if you do
not want to adhere to the above rule you still cannot combine it into
DTS branch.

Best regards,
Krzysztof
