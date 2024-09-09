Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4386014C583
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Sep 2024 16:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725899061; cv=none; b=hEz8JmVOvVWixHgGq9jA7Nwkf56wOo2p5J/l+SlbmBACZwRo842AJIq5ISDQNTHcdujG2MlChrbgclqQ1mY8LFaQnr2A0pLYHcEGCJMbWmrXRqtFOFH1kXD5Faf1BA8E0UpcC29uFsSmatzIMtHoCj1v6IrVXKm3Abgwg4ujx18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725899061; c=relaxed/simple;
	bh=0Rh4KmqChPzqTEwbrGqXfSqb6i9rs9C8GBy9+jQDHQw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jk2W4kliVUU8Drvl+VPweS97eHn0IG87KlySpjTIajKFK1cvBWx59oS9rdCeqxD79PQpJbpjQubkdZYFki81MqMschwepvIoGW/IqtQ8QRxBuRj7A9uu+nPO7Vd7cxcCyTnGur9tMbHPGwIc513F302cvBh3pBpxZ1OnLfPZFfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YpBd1XgC; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YpBd1XgC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4896dwsf001006;
	Mon, 9 Sep 2024 11:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=iJQ6QpbXlFmFTrokEH
	XawRi6AwzM3shtaMUFaKsiIKQ=; b=YpBd1XgCh84u0CRKwzEoYhHgOoOwIEDlal
	jr2P0DnO2t4R5SevDkUDcYEfZ3/j91BxhkTD1qLELjfgfN9bLIc71ky5vwlcmKj9
	9Ymufg2t5/hM+zQm2iocLgLwCG3YjC8XprR6IfO12n7a3ZUkPqZdAfR1bCdRgyak
	1w5Ky2tZDqCFyGIO+CXxdO4pyPnth8nKnlHN6aKhh9MDbhcTcRHse9bE7oQy4AfD
	kLNZsqMVGsUYKBEeVGF3eB00me34r+z7FmYMc6aN9s5y7m48rHkLS+jmpc7Ymqv8
	rRrQwm0hudv2tbDIgC1cadkZjyzBRxrHsMdYgcgUUXVa+HOhevMg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41gm7x1uny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 11:24:03 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 17:24:01 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 9 Sep 2024 17:24:01 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 8DEA0820249;
	Mon,  9 Sep 2024 16:24:01 +0000 (UTC)
Date: Mon, 9 Sep 2024 17:24:00 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "David
 Rhodes" <david.rhodes@cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood
	<liam.r.girdwood@linux.intel.com>,
        Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "Jernej
 Skrabec" <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 06/13] ASoC: cs35l36: drop SNDRV_PCM_RATE_KNOT
Message-ID: <Zt8hIGzvPIsmZho/@opensource.cirrus.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
 <20240905-alsa-12-24-128-v1-6-8371948d3921@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240905-alsa-12-24-128-v1-6-8371948d3921@baylibre.com>
X-Proofpoint-GUID: YzC5zK9-HLCkV04WUzI1FtnUinHTtgDV
X-Proofpoint-ORIG-GUID: YzC5zK9-HLCkV04WUzI1FtnUinHTtgDV
X-Proofpoint-Spam-Reason: safe

On Thu, Sep 05, 2024 at 04:12:57PM +0200, Jerome Brunet wrote:
> The custom rate constraint list was necessary to support 12kHz and 24kHz.
> These rates are now available through SNDRV_PCM_RATE_12000 and
> SNDRV_PCM_RATE_24000.
> 
> Use them and drop the custom rate constraint rule.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
