Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA0F2D4B6D
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Nov 2025 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763045243; cv=none; b=Qw5hRnGKMcwQwPc9QSAhop/6y1GgpI/NHVeIWWRujmiuWIOMB/TFdAatzgu2vgouywc2deNJRgallH03hmYOMYGUTyY3vNSDuUb0ShPf38+MeuprxgLtfxjK7ahjO/swvT40Ab2rIaeWrzB9XhMTmqcTksh6jL72vj16pT7wDfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763045243; c=relaxed/simple;
	bh=F2kBxpSXrkU6fwfKy+g1N0BGk9Qwugl4Eo5aCFQcm9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXal/AWxKM2oI8r+IjfZdrpAV6E+dNCrZitOqQVVmmyDhtYFuoNl+DFjI/QYcB1UI81LoMPbD+S8r+mvgbVLT7fmaQixzno0Ac5Xwx56tkChkREcxs2dbiw1JWjmziaeHqGMpJGgOEMkfro6oc+gnMJH476sNMWejAfYJ+RUxDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/JRKlQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CkjsmoxX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/JRKlQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CkjsmoxX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD9QKBk3121498
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Nov 2025 14:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c/j8O4OMZ/iO6ANHgdWOttUeORFw+6paoVM6GB+aNhc=; b=b/JRKlQaoXhQbjBg
	7mm9S/5h3Fp/qe27uSlmDQXdKJyVelTPms9TAYlDvBXVpwrx7Y/JPF42qOoJETR1
	cZsoxMoudkiU5Xx0VLidAV4Vf4PHDod433Ykxn74s+LsoMkTrwjARIl3IDm/A+Rr
	grUZjvJu70AF5w6jwH7l4Aq5Be8BuM4nP6pt3KJhqDbJ+xtwdCLznzo3aNk/9SZu
	F6Qj+Ub89gKav1oigAckmv9WKdjgeoUN7Q2qgBe471l3GyeBKiIxCveVSXs/+XGB
	RXI/WhEDsA6qtDMbbTNJWwMSedDbYI2Id5NJthr9QY3IvsFmN+3HmL11WKKwX00L
	cTlHdQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad5put8ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Nov 2025 14:47:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8800460ca8dso4071286d6.3
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Nov 2025 06:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763045239; x=1763650039; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/j8O4OMZ/iO6ANHgdWOttUeORFw+6paoVM6GB+aNhc=;
        b=CkjsmoxXOVOJAeOeiLBuVUx7jzqP/K+CAYziQdfqeGnRXo+c2B5QVh4geQyV+GJbOa
         gQcG9ScpQrB1Ns4ZLtq6wtN9iTZ04XOgCoYBYB5Ew9hZTGpEh2R72/ecHm+Lu5bKgLMo
         vKLo4k4DtJNG9e8Ozmqv9DQ8zQD7Al53uv2xlKUrF6MNOkTm9NPUspydkYjlrxcUTVc8
         ZVtJYsemTGZWfUyZdt6JtuzN1ecGkpWljFu2RKUE3d4CZg/rf/shbJ4s96+gZhnpgWlc
         DZbUBawVkbTyDreWreSUiHnwSmjKo+ps7eAGTFDrOGJE5I7OMbuKaSBbwK0GKih6nAp/
         pGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763045239; x=1763650039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/j8O4OMZ/iO6ANHgdWOttUeORFw+6paoVM6GB+aNhc=;
        b=NWWeeucgiEgJzo8FfEY7Q4zYgT8o1CiRk4SmUsj+a9jgYE16MJ3HzegxY/0mzzvLso
         7o3+nXy3VewaMs/FxOIiR3Cxbg8n42mS6t+w4KLr7jQPHwGcO8hKKywuCCVF7/rz83c+
         wC//F80/vfJyQDMHMbYoM0X8HBzIwN8mmRSk6/BLKBe+TENRpXiGQ63oP59/cAxh7eki
         aQc4DSpD8Xn0oc09u/iSt7qTTLuYGXYZ72Ct1hJbGc7IKEN9Atk8AG/NnI871AQOKkMI
         rb8SiSSGvctf4i+LAje24t4l3sWLBAcF+f6gWjC9Yh1Ug+5vNLosv77xQEWkWrdCJz+8
         e1Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWOwqz6z4n0zotThPdCZMpP/wDHNJaZvHRxYDG7lP3b6u3bS9J83qyAARdZi34If2DwsMGiyUaCcLitkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwKv9nevcSKZ9q2CCmdEDRvXltYkbAUr5tHaaA2kXfIaOrPEFb
	mN4p3c1P1mwwCQI0nnEYzp8b/vqMzjE4wuKuLVZkiAHTGAJ2M4IrK8EKivRywoPPPEouexgEABy
	quyx5CjC8zObi89Qpl2WKbhgBWKMc7Clh3xG3BHBpOhyBvvpDQ62SDI5jCXa9P8Bv0A==
X-Gm-Gg: ASbGnct9gUbvOSX+ENiyCKPUSiNlOgrDPQT8Z3ouwQE6F8wq4VRejKCHDsMl5IM6/JK
	QLMC+yRBc69/myC74PEgss1ZCGsK/MXisyh1p8ZAFZ/L0bu6d8y29jYj91MnVBKUTxgB4/mz5vY
	PeNnLGnVinijzn/QFO/pwsK65kf5G3YABVkF8IrlAe0SnKRlQ6ppaTVZP0XbXlqbaVHkKcwAk/Q
	d1NacS+4kODI+ve6c2a45daAbOQmfn3GbZgEZw85zQL7aRwL1Md74V2LcKrrTI+8EHjSVm6YLKH
	SXeD372sE3ZnrtVV60/10ArLrz3E7SnYZdgs9nZo+tzSybmFjquQqf4uCkvh+hF3Bj2A3oaPqN3
	+GqF06CLkhYogzD4VaNJAUOhhTFwsyiaqYMFf5kL0bH6UegJ8o1/AYllf
X-Received: by 2002:ac8:5f10:0:b0:4ed:7ca:5f33 with SMTP id d75a77b69052e-4eddbc9256dmr60355231cf.5.1763045238420;
        Thu, 13 Nov 2025 06:47:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM7YamsAo7x44iby6/PzuNKLIab4wveVf6S4JQ4cd4mg9yAzxbvu88BKH+RnT7m5FWyF+0JA==
X-Received: by 2002:ac8:5f10:0:b0:4ed:7ca:5f33 with SMTP id d75a77b69052e-4eddbc9256dmr60354251cf.5.1763045237576;
        Thu, 13 Nov 2025 06:47:17 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdaf6dasm176196266b.63.2025.11.13.06.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 06:47:17 -0800 (PST)
Message-ID: <45915f40-caa1-417b-95bb-deb7363a2ffc@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 15:47:09 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device
 properties
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
 <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
 <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
 <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
 <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E6/AZKdl c=1 sm=1 tr=0 ts=6915ef77 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=IegXRtMujPCPvfbY5ZIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDExNCBTYWx0ZWRfX5mUSc4gDVfdI
 gXAEoeqNqPcaQIGYW9pcJdRvDB+oHVLNrjJ6sMPr8JKIEguDZvqnPkthq0Sp7PfVM01sPuuIPbP
 h1jR06afLMt4YYG9xH/vD/ZCT1gcfYmjqpOwZcVS8adew6kuKYOolTzF8+vCWUGQ4yqlgrJaTNT
 18B/T5uJAFXdW3K53T+Ovfcz/SUSInTiRUg2DphWpDRTqyXQ+Y+0dezAwVRT7nnY09L03g1iMZy
 ZE31sJYUAVAt+v5i0fg2o9Dq7Hs5uozftC9tDHwslQporIUilUPwr6XUzEF01PNYBp7Vv9DOFxJ
 53clQCYKtGMdRiwL0vtIPRrE9w7QBot1qaqW3ykyr1tkBOCU2vp0nWCZ93BWCjLX/Ht4ymSDsjm
 HzexQq/9FG3aWD9/rnqOD63YXHntqQ==
X-Proofpoint-GUID: OqdCeb0sg67XgQ_IsC7wxyV2k54KsDyz
X-Proofpoint-ORIG-GUID: OqdCeb0sg67XgQ_IsC7wxyV2k54KsDyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130114

On 11/13/25 2:41 PM, Bartosz Golaszewski wrote:
> On Thu, Nov 13, 2025 at 2:33 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/13/25 2:18 PM, Bartosz Golaszewski wrote:
>>> On Fri, Nov 7, 2025 at 11:49 AM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>
>>>>> In order to drop the dependency on CONFIG_OF, convert all device property
>>>>> getters from OF-specific to generic device properties and stop pulling
>>>>> in any linux/of.h symbols.
>>>>>
>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> -     if (of_property_read_bool(np, "snps,tso"))
>>>>> +     if (device_property_present(dev, "snps,tso"))
>>>>
>>>> This is a change in behavior - "snps,tso = <0>" would have previously
>>>> returned false, it now returns true
>>>>
>>>
>>> This property is a boolean flag, it cannot have a value.
>>
>> Every DT property may have a value, so this is not as obvious as we'd
>> like it to be (IIUC - unless that changed recently)
>>
> 
> That's new to me. I thought that if a property is a
> /schemas/types.yaml#/definitions/flag then only its boolean form is
> allowed. The fact that the dtc can compile it with a value doesn't
> matter as the bindings are the higher authority for DT sources?

You're right, I misrepresented the issue. read_bool() was historically
used for making sure a property is present and this was a problem
when the type was != flag.

Please discard my comment

Konrad
