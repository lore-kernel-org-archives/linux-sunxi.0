Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED89334C08
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326788; cv=none; b=NBUFWEBEwKop8VUxaNdlJRjKTLhOUu7pbWCaR47/t3+1QBtMf0f61v1J/zEX1uI+oSpSl+ln70TbX6fMqNa2P1Y9+I/yl7W46oRrzsCLOBv9X/sZwHf0mCAMEpZWmcgVIhfe7Ni/LfpzUYjJRNFDmfyWZYCiRWoR1fI/BSudcKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326788; c=relaxed/simple;
	bh=BOh+Hb4ZxI0byKHwLdu1YMSdOQ8nQdY5hZERfclrwks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1vlxqv/ue02VC8bA7FtgPEKcttFixbkDq/e9CQaa09d6a6RFy3/3QFxWkNv5Bm9U3JLlSSvc99NHasTikgdlZZKo8DEC3cE8QoOGL5gCBS3hboQWXgMP6qzwmDYkrBsbtfMPRQZ4aIqyK8EJOL3WLeKhq+3vUXen3X1/XDjgUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tt1g9aWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMW4acm/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tt1g9aWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMW4acm/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66683YHe4150724
	for <linux-sunxi@lists.linux.dev>; Mon, 6 Jul 2026 08:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=; b=Tt1g9aWRdhyI3BpO
	bvxcoGq7kYOipwI8sI86zxkmNdiblCbEIIy0D6ekqZISLjLM2a33y7RzY76GbicN
	Opq7MS5ZQyamKmgeZkedVYAFfw1KRPYi8hl3Y7h7kuir3yf0DUot7pMFqfcV2RX7
	X6ly6HXPcg70fqU+dH3N/iuMe5KE0DqLRF0s4qeJ6w03zgeEubZlkFJyH6FDUo2t
	Et+Ig2j6kpZC/v51lNaj0P+xbzzB2QuKkvGbM4AuZdQSxZloAH/4eroeiJwOgPxx
	kOehTF0x3+rZPy9CPDosN5R/kMP09AyBofAR6Pe/VMGVWMs1S1vCPm7OD23UZkSl
	ZSPxow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h503yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 08:32:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c27616421so10786551cf.2
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 01:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326758; x=1783931558; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=;
        b=EMW4acm/CXU04ZJP0ae8AaGHpbXX+rbNW+Vmq/6h4t8eN2fpEcfh5RnkeyYnZ5N2ys
         jAHPMbOFF0z37KChWuFWf0z5aQGgcRNLxwcoqBRl3qLqthUP0+JlJumUMJlGrTRE1Jit
         zW3epmMTypnceRZlZWa3hDJ+0ey15iLPXFzbrdo0lfGo0Y2/Ajgv7PhdBEFEVPcD/C+P
         lBuSMPWEW9eJqPQ4eUeb0eaYRr22bCPiJzTB3oPOUCmU8DirVRqSBFkhdI7zX2aYK8W+
         rsZiH0s3ZgN3blXaVTWaKw2JZDS11Zatz/JjlGxXCT3+14kPHOhJVmUHUBm1aKLyUSiL
         N8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326758; x=1783931558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=;
        b=swg91PEw3jXfLD+06v3uAO6fY1r+dcPpHQzCWy6/drAnd32CEGj6OxFNjdney68Rom
         FzvQ+E4egWduWSpmjuQEvhPP1rs2VNL/38lD/7+UZvmULqxjGS1xFR45dRiIWfJ1hi8g
         YqCdX6cx3cWRlWYYMOZgEz31uzp30qPZ+0GNXPuTq00Q+uaAfiQW1ReoQ3vPoAU1QORv
         kakec5LJ7Yv3vYUtZx5ty+KEoCJQUKd3Or7JqgrAOAKNa1rCZ2glOWTeoVhY7AlqNJN2
         q/bqMsTMhH2dAZhNvU/FrLj1/wfuymXWWkc2UOZ9DTB1AGNPVHXRcGAs5pxkFFo4EofT
         ib1w==
X-Forwarded-Encrypted: i=1; AHgh+RqGXhpEvaJuyVvExmITTu4AfR8H8Jaf68DXOZ3Lv1MkOcF2RfVD2MItTcIs0w67k6M5l69b2S2Afk59Iw==@lists.linux.dev
X-Gm-Message-State: AOJu0YytCXermsBG+WPCxvOsuj1kVKK84+n64SpQWDYBqfWwKKKSQntI
	FjhdkzSHMuiAb3Q9DQVKYZcOsabFhU2L7Ztg5xUA0roKD4Qt1Hps2NDk3959ArDRr345cat4mN3
	92FSeq+rKDezHCMjC9jzTnzLkelY8Orx8KivZRsZcuGQuVKEufOxHaMFu/sS3aSI5Uw==
X-Gm-Gg: AfdE7cnTUjDVfaiyfDcz9T6iRumiX1NwjtFtgN4eTnQtIJNfViU9vJgBeHv+oegtIq9
	tAoKObRH0W6QlNprwsxxic37SuWFWomZ/KcPP+aLR571Wo60PbAHoywgluaWZfIj0eKVy0STZ+k
	wQpHQQOz9lnnG4fTmDvS46a8WSL0tZJANbzn9qt9vNjFhTnMH24Mu4Y4X3GDl0RqmAeeuyh5UDK
	dATOE+ZflQ/MYErrAScSxBI0dwVQlSIsn+VGY2AHIKwQnZw21LPLn52WRfKATp0zUIvs1EdO4ti
	il2q+7i/6QUR1QpY3rQsmoHoczf/am2LR0VB4dJCAbfTKfENXmXvchdNt6j5BM4X9GolkJLEus0
	YGe8D74k2KcacNG5jp5PXiSw9oYBGO3VcSL0=
X-Received: by 2002:a05:622a:82:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c4be04aeemr79017191cf.5.1783326758019;
        Mon, 06 Jul 2026 01:32:38 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c4be04aeemr79016281cf.5.1783326757507;
        Mon, 06 Jul 2026 01:32:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6093786sm694743966b.20.2026.07.06.01.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:32:36 -0700 (PDT)
Message-ID: <f1e7ef14-7186-4854-a832-a34596d3313f@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:32:27 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/42] firmware: qcom: scm: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin
 <abrodkin@synopsys.com>,
        Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon
 <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 509y_XZCA9ognxw2VukGEU1Q3t44eL8i
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX+W/0bWbd+Jur
 h9d+u8d3gZ9sUOsQKwUMYR+8Svvp/hKfLIw7SQ8yKk7F58bFYZ4UdbL/zV7D239wfIHnb4qxlWo
 4cVMo6LlW4rINx7DluO9kudVUld6SkU=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4b682a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7yxQZbK4ublJ3xJh_1MA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfXxxynvHwF7dMw
 DTltqk5+ZhzX7fEryXSQgAPHiATqQNKaqsnBhWg3OIIuLWu+QuovH3UEJA+Qjv1ZQ4BUGYSF9VY
 nNKRjwsO9oolZ0sTYFs02fqhGz4WI9WgYz+eaST3Jr21VunIVwrQ+m+/ou7iQ++sXyFZkc9JzGY
 CivD9mX+c1AF4BoCR14TGFIac87rnZAjIe5bqEeDXmou86Vb6A6itgEd5yVvnfbmZTbq+DXrPwz
 wvawa8y8jm0v1F9L1QPFxkietcqK/c47tG9dtu7NhnH4pLZRjKv3uPqDiMS+KqsDFCZox9TDkBN
 HriFV+zFfg9XV+9mlyoQRkJzky2IrttqeZJLbPEdmy2p0Je0SZgIx9MjBQRgryeVfc01Thjwwol
 7vpIT9JCFBFte2Xac5fHXsusGDm6/uO3Fs7aH/y0pwmJgwu6X2q88a5NKqs11oio78rktv/KQTm
 ToHPXWZT2frku39CFNQ==
X-Proofpoint-ORIG-GUID: 509y_XZCA9ognxw2VukGEU1Q3t44eL8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060083

On 7/3/26 9:38 PM, Mukesh Ojha wrote:
> Switch from of_reserved_mem_device_init() to the new resource managed
> devm_of_reserved_mem_device_init() so that the reserved memory region
> is released automatically on probe failure or device unbind. This
> eliminates the err_rmem cleanup label and the need to call
> of_reserved_mem_device_release() explicitly on error paths.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
