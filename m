Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB79729D19
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Jun 2025 06:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750661936; cv=none; b=mRm9MVY56n2DzMlsN5NOTC03wNUw5ryvwynW8EZY6Mj6spHK54wzsOFUiB2LHGMQITVDf20aX+83KpxWglGTcraMTfepaho6UO4IeXLD9L6xRYCZxGZC0xwxEPHbsvqeIaBYpB2Hu3y5gdnKttd/08quOZv9x73Jxn2UER5GgN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750661936; c=relaxed/simple;
	bh=AscXhx0QcJCjy/07ldN8aACQDcs08qv16ppqJ9DFbMQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=AFuML/CyqFKkEcRH707mLtxO4aw9zWWgaw6ZgUtCCH4pCwQhooNYOQBRAU4+0rwVmOyIbzH1g7N2SDVlynbQvmadXK0OuQ80mZYuexMLXSJoYqPcw5p6/3D9ymlEAOUHqV13DSQKqWM7vZjrfdeGV7HaSmz2stYQc3680ofM9JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=imtNwEFH; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="imtNwEFH"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 73421A0119;
	Mon, 23 Jun 2025 08:49:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=YKFIq1SeVmM/nBqAQ3Bj
	uEtsh4GpEB7ByrAjwhyB/2E=; b=imtNwEFHZ1G6j/wXqaZupldLTlUOBRXeZcu9
	dKO87/+hT9P0E8cDlJbdqiJA1S084NfwPEAmp51c+m5EcHRDQNccQ070em3DAqz4
	mDci5IxTlmfQmdP2V/FxdJTh4+2WFYCAEgpeYnNpJsky327SbuI3JfWq1g908ctD
	C4kchLcNUWPuY/BhxRUWdCM5t2TkkGAbjv8rOYmJJT6zfj6pCKxG4j5jdFfzqJkF
	+u/kq6+jUwG+AjrGb/RGB/cSgKXtk4vp5q4YbMz1Q1TFrAYOKqiZdSCCfOVV1WH2
	rvWTiH/+mx/RlFIyvHBUohT6qyMbeMffVunIedKI+GOU7U2gAGdh60hFLVJQaSDm
	8x+5WiN3uEkLWtJd+Fg56iycMzwEChLRLriTqwLrn8rWsHA9Rj6hn5j3UnyjzRJo
	v2rg9mqJfFZ1jEV+dpCHhqgWzg+fsaAHFz/+qOuOIh/duflf7Wo6mJ04wQLimZGg
	R4vnafT1UZMAyC5NtEogpEiZbOfa5G7LHWvz3S8PPRM2IgmdU5ZYyzVxe7eFKT3B
	dSeGLkyxFh8Nf9dXQz7prL2WKI2n9RJuICACV6MHv4U+ImbhWz2JNi4svKvhBh6Q
	PE6qUlCn+nLtFQ+uW/Fhv/B4aXQbYVvIAksX6mKhyZIBMorFlmAPTwXzuRgpCh9f
	HuYzF3k=
Message-ID: <c6500082-565a-4b00-ae27-4d943586e58b@prolan.hu>
Date: Mon, 23 Jun 2025 08:49:58 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH v10] dma-engine: sun4i: Simplify error handling in probe()
To: Vinod Koul <vkoul@kernel.org>
CC: <dmaengine@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, "Julian
 Calaby" <julian.calaby@gmail.com>, Samuel Holland <samuel@sholland.org>,
	<linux-kernel@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
References: <20250610075315.397810-1-csokas.bence@prolan.hu>
Content-Language: en-US
In-Reply-To: <20250610075315.397810-1-csokas.bence@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D6D7366


On 2025. 06. 10. 9:53, Bence Csókás wrote:
> Clean up error handling by using devm functions and dev_err_probe(). This
> should make it easier to add new code, as we can eliminate the "goto
> ladder" in sun4i_dma_probe().
> 
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> Reviewed-by: Julian Calaby <julian.calaby@gmail.com>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> ---

Vinod, is there a problem with this patch? I'd love to hear your 
thoughts, because it has been practically unchanged since March, and 
only minor changes since the first submission last December. I can keep 
rebasing it ad nauseum every time you push to dma/next, but I think we 
both have a better use of our time. So, if you see anything that should 
prevent this from being merged, please tell me.

Thanks,
Bence

