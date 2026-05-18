Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF87943C05E
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108667; cv=none; b=gzJw62coLSTN9vbEPHKY7SJ0sFkvSBirWeHwnuHA4hOHPaVMcVWz+nnGX+Wi+34AkjLZkmG1abfSHp1dEx+q8xQSk++W8U/tYR9Vzs7LuZgKjpO0kpfPA8HwT0IIe5Q+cwrC7rpVtup3R0Mm6cJ0mQiNe9W8OkOQn6WtawuxwYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108667; c=relaxed/simple;
	bh=Gr6HIT44vFcV8C+E8WlT4h6l59fieOXbPOTn6N6uLP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hwoehxpf+gk7cGRoIOnk4FywLOiHiiCLKPXpgrACwA2zSfVYml3H6SGt/GnINZIew1lj2a0WbDVPdtQwtTb6YWKQ4jtOMEcL47VZXMTEaaeDxLLwFFVoaZkHMUaX07UU6pVp6UhlGByTL0BtQLV4IWjQL7SpAWmciWYY4iGfXn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MBvSK9Hv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MBvSK9Hv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16A1845BF;
	Mon, 18 May 2026 05:51:00 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 430EC3F632;
	Mon, 18 May 2026 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779108665; bh=Gr6HIT44vFcV8C+E8WlT4h6l59fieOXbPOTn6N6uLP4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MBvSK9Hvf/XPfsiNPIrSzcte289au5Y2Cn/b5XVPTmU2JM1ONgQxz9obCfZV4CfOB
	 30LL8Sj7Wc+RwEJqfZ7WcA6Kn9Hl1wxGOhLMjVyZb3VrbCprbvgOzgLBB0nfPUcdcq
	 6e99de2KxWXLms/HW1aq1CkIngmgWM1xb00lHbrA=
Message-ID: <4883b037-45b8-4c9a-92ba-72e6b795dc93@arm.com>
Date: Mon, 18 May 2026 14:50:57 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 linux-sunxi@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
 <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
 <6d8659f393e0bb4f0805107a17e306422982247c.camel@gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <6d8659f393e0bb4f0805107a17e306422982247c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 5/18/26 13:29, Alexander Sverdlin wrote:
> Hi Andre,
> 
> On Mon, 2026-05-18 at 13:16 +0200, Andre Przywara wrote:
>>>> And anyway, I see a *dual* USB-A socket on the pictures online, in
>>>> addition to the USB-OTG port. So where does the third USB come from? The
>>>> A133 only supports one host USB port plus the one OTG port. So is there
>>>> an USB hub chip on the board?
>>>
>>> There are two hubs, one on each usbphy. OTG side hub is even bus-powered,
>>
>> What do you mean with OTG side hub, exactly? Is there a hub on USB0? How
>> does this work, then?
> 
> the upstream port of this hub is wired to the USB-C connector, one port has
> CH340E USB-UART on it for the console, the other port goes to the SoC usbphy 0.
> So it would be "peripheral" only, I suppose.

Ah, that's interesting, I was wondering about this, but don't think we 
have seen this before.
So yeah, then it's definitely peripheral only. And please state in the 
comment that it's connected to the downstream port of a hub, so changing 
it to "host" will not work.

Thanks,
Andre

