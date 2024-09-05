Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C52B1A0B0F
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 17:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725557115; cv=none; b=PRIjq4w0n5jExFbnZtEV553R0SyRhuGgM4zRcddVkFzuMSYtQCEWDANL52c3sVdAQ4AS7zJ5eibSqc5ugSkC+8QrhjNyfYCygZT9hM4QdEBkYjtnP4kZTyLQEQ1uqLYOchbjVE8pkVvnK6sr9nekIRqH/8ngoJDuWL51q9WVe/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725557115; c=relaxed/simple;
	bh=oA+JaK45bIvDN0Y/g2haYI3ERCCF35W5j6c76i1XHWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rk2lm9QR+o3pe1KC5vyn5TKsygv095tkow7ahNTTWn4oJWlYjWXxCtiszva6dfGF44Qmfk5ycmzwbBcetTgF1GLmYUu8A+WfHLjguK+mw0e7/k1OrWiPwa8B0CNJ0BZkR7mdRJYNa0G2xRmew+US8Y/IPmMZpgBHkfm9SHpnHd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VJ9ZDnhV; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VJ9ZDnhV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485H6VQw012415;
	Thu, 5 Sep 2024 12:24:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2EPLvM+fTjNtBBRKdAtax43O9eQJ3gxJ5hQy/CTb4Wg=; b=
	VJ9ZDnhVEjybUXSFuEkkY1m4J26M2uWOb4LI/E2E4ORRD0JAsVO3YQ4A8lSoKQhW
	2PRR7L7P81m0idpUk9U5x2IzMXPDhD61QpRjoh/8Lah7udUAcTm3FJCfBPvQMN16
	VC/KJDrsvpxfKjup2poagnIkMYEes47trH/+M8EsO8J2PAumxasdvLcB++KpAqzj
	7xm0RgTdYoWAKEykbgFcwb+RiClNkJ+DWD2eQrMpxRRIX9hWnQgAeuHPEZm/Fsai
	JnIEyan/xomUEYLwb5LP7qWzAztyba2nJOOLCIp8xqrGaRwHJvU+Q7qp0aujMrAz
	F2lDsnQYRU4P454t905lBg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41c0jxehg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 12:24:42 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 18:24:35 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 5 Sep 2024 18:24:35 +0100
Received: from [141.131.157.113] (macMW3KVPQQ2W.ad.cirrus.com [141.131.157.113])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6D335820244;
	Thu,  5 Sep 2024 17:24:32 +0000 (UTC)
Message-ID: <c2b7654b-74ae-4195-be0d-463b33af5965@opensource.cirrus.com>
Date: Thu, 5 Sep 2024 12:24:31 -0500
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] ALSA: update sample rate definitions
To: Jerome Brunet <jbrunet@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Cezary Rojewski
	<cezary.rojewski@intel.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>,
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
        Samuel Holland <samuel@sholland.org>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
Content-Language: en-US
From: "Rhodes, David" <drhodes@opensource.cirrus.com>
In-Reply-To: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DCprltle2cLpNuwRuuh1hqg0jsfwhZ4c
X-Proofpoint-GUID: DCprltle2cLpNuwRuuh1hqg0jsfwhZ4c
X-Proofpoint-Spam-Reason: safe

On 9/5/24 9:12 AM, Jerome Brunet wrote:
> This patchset adds rate definitions for 12kHz, 24kHz and 128kHz.
> 
> It is follow-up on the series/discussion [0] about adding 128kHz for
> spdif/eARC support. The outcome was to add 12kHz and 24kHz as well and
> clean up the drivers that no longer require custom rules to allow these
> rates.
> 

Reviewed-by: David Rhodes <drhodes@opensource.cirrus.com>

Thanks,
David
