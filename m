Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E542D1FA4
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Aug 2022 15:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660317637; x=1691853637;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tiXzAiAPz+7TJwuTyFperc5ADCgpo1f1RWfH/4D+4XM=;
  b=jGRGfoA57ZQF81iqgtRxNQBDwDsOT5l56zlNZYuQHqEq9t4GzGp22b9/
   P1KhGhQZjtjcCI52il15E9e5eaOD94/w3rTPKIoD0X9xBXBSF74M8/xhi
   p+dBdz6loWkRfXUftp42ITOxez5w5bGmDAtmnm8cZu6O7UlsL3EAGCumr
   cjF0xY1nye7AC+VLbTfTMf5p5yz1A5ffzN4rGx0sw5geCCwvAve42Hb2X
   Sq7OL2qjyCxJPkvKLX54mSilx/fFJW05jACyKKRkdwu+gZVNyfzfEMAZU
   UsOL1phGqDR2UzkSdHz+2Obf7Ht4H81ka1vY/bNRN90EDPWIhpCP1Iska
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="278565652"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="278565652"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 08:20:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="634672764"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.73]) ([10.99.241.73])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 08:20:33 -0700
Message-ID: <73dceca7-5244-ffa6-6ead-d4de84584b68@linux.intel.com>
Date: Fri, 12 Aug 2022 17:20:31 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
Content-Language: en-US
To: Ban Tao <fengzheng923@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <1660229343-14133-1-git-send-email-fengzheng923@gmail.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <1660229343-14133-1-git-send-email-fengzheng923@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/11/2022 4:49 PM, Ban Tao wrote:
> The Allwinner H6 and later SoCs have an DMIC block
> which is capable of capture.
> 
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> ---

...

> +
> +#define SUN50I_DMIC_RATES (SNDRV_PCM_RATE_8000_48000)

Seeing supported rates in hw_params callback, you probably want to take 
a look at SNDRV_PCM_RATE_KNOT?

> +#define SUN50I_DMIC_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
> +
> +static struct snd_soc_dai_driver sun50i_dmic_dai = {
> +	.capture = {
> +		.channels_min = 1,
> +		.channels_max = 8,
> +		.rates = SUN50I_DMIC_RATES,
> +		.formats = SUN50I_DMIC_FORMATS,
> +		.sig_bits = 21,
> +	},
> +	.probe = sun50i_dmic_soc_dai_probe,
> +	.ops = &sun50i_dmic_dai_ops,
> +	.name = "dmic",
> +};
> +

...

